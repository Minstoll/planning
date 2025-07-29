import re
import json
from pathlib import Path
from typing import List, Tuple


def blocksworld_pddl_to_nl(pddl_path: str) -> str:
    text = Path(pddl_path).read_text(encoding="utf-8")

    init_body = _extract_body(text, ":init")
    goal_body = _extract_body(text, ":goal")

    init_facts = _extract_facts(init_body)
    goal_facts = _extract_facts(goal_body)

    init_phrases = [
        _fact_to_english(pred, args) for pred, args in _sort_facts(init_facts)
    ]
    goal_phrases = [
        _fact_to_english(pred, args) for pred, args in _sort_facts(goal_facts)
    ]

    init_sentence = _join_phrases(
        init_phrases, prefix="As initial conditions I have that, ", suffix="."
    )

    goal_sentence = _join_phrases(
        goal_phrases, prefix="My goal is to have that ", suffix="."
    )

    return f"{init_sentence}\n{goal_sentence}"


def _extract_body(text: str, anchor: str) -> str:
    idx = text.find(anchor)
    if idx == -1:
        return ""

    # Find the '(' that starts the part containing the anchor, e.g. '(:init ...'
    open_idx = text.rfind("(", 0, idx)
    if open_idx == -1:
        return ""

    # Find the matching ')'
    depth = 0
    close_idx = -1
    for i, c in enumerate(text[open_idx:], start=open_idx):
        if c == "(":
            depth += 1
        elif c == ")":
            depth -= 1
            if depth == 0:
                close_idx = i
                break

    if close_idx == -1:
        return ""

    inner = text[open_idx + 1 : close_idx]
    stripped = inner.lstrip()
    if stripped.startswith(anchor):
        body = stripped[len(anchor) :].lstrip()
    else:
        body = inner
    return body


_fact_pattern = re.compile(r"\(([^()\s]+)([^()]*)\)")


def _extract_facts(body: str) -> List[Tuple[str, List[str]]]:
    facts: List[Tuple[str, List[str]]] = []
    for pred, argstr in _fact_pattern.findall(body):
        pred = pred.strip().lower()
        if pred == "and":
            continue
        args = [a for a in argstr.strip().split() if a]
        facts.append((pred, args))
    return facts


def _sort_facts(facts: List[Tuple[str, List[str]]]) -> List[Tuple[str, List[str]]]:
    order = {"handempty": 0, "holding": 1, "clear": 2, "on": 3, "ontable": 4}
    return sorted(facts, key=lambda fa: (order.get(fa[0], 99), fa[0], fa[1]))


def _cap_block(name: str) -> str:
    return name.upper()


def _fact_to_english(pred: str, args: List[str]) -> str:
    if pred == "handempty":
        return "the hand is empty"
    if pred == "holding" and len(args) == 1:
        A = _cap_block(args[0])
        return f"the hand is holding the {A} block"
    if pred == "clear" and len(args) == 1:
        A = _cap_block(args[0])
        return f"the {A} block is clear"
    if pred == "ontable" and len(args) == 1:
        A = _cap_block(args[0])
        return f"the {A} block is on the table"
    if pred == "on" and len(args) == 2:
        A, B = _cap_block(args[0]), _cap_block(args[1])
        return f"the {A} block is on top of the {B} block"

    if args:
        return f"{pred}(" + ", ".join(_cap_block(a) for a in args) + ")"
    return pred


def _join_phrases(phrases: List[str], prefix: str = "", suffix: str = "") -> str:
    if not phrases:
        return prefix.rstrip() + suffix
    if len(phrases) == 1:
        s = phrases[0]
    elif len(phrases) == 2:
        s = f"{phrases[0]} and {phrases[1]}"
    else:
        s = ", ".join(phrases[:-1]) + f", and {phrases[-1]}"
    return f"{prefix}{s}{suffix}"


def build_dataset(path: str, output_file: str) -> None:
    """
    Json file looks like:
      [{"id": 1, "nl_query": "..."},
       {"id": 2, "nl_query": "..."}, ...]
    """
    pddl_dir = Path(path)
    inst_re = re.compile(r"instance-(\d+)\.pddl$", re.IGNORECASE)

    numbered_files: List[Tuple[int, Path]] = []
    for p in pddl_dir.glob("*.pddl"):
        m = inst_re.search(p.name)
        if m:
            num = int(m.group(1))
            numbered_files.append((num, p))

    numbered_files.sort(key=lambda pair: pair[0])

    data = []
    for inst_num, pddl_file in numbered_files:
        nl_text = blocksworld_pddl_to_nl(str(pddl_file))
        data.append({"id": inst_num, "nl_query": nl_text})

    with open(output_file, "w", encoding="utf-8") as f:
        json.dump(data, f, ensure_ascii=False, indent=2)


if __name__ == "__main__":

    pddl_file_path = "./blocksworld/blocksworld_problems_pddl"
    output_file = "./blocksworld/blocksworld_problems_nl.json"
    build_dataset(pddl_file_path, output_file)
