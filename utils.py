import json
import subprocess
from pathlib import Path
from typing import Iterator, Tuple


def query_iterator(json_path: str) -> Iterator[Tuple[int, str]]:
    with open(json_path, "r", encoding="utf-8") as f:
        data = json.load(f)
    for entry in data:
        yield entry["id"], entry["nl_query"]


def _extract(text: str, anchor: str) -> str:
    start = text.find(anchor)
    if start == -1:
        raise ValueError(f"Anchor not found: {anchor!r}")
    depth = 0
    end = None
    for i, c in enumerate(text[start:], start):
        if c == "(":
            depth += 1
        elif c == ")":
            depth -= 1
            if depth == 0:
                end = i
                break
    if end is None:
        raise ValueError(f"Unbalanced parentheses for anchor {anchor!r}")
    return text[start : end + 1]


def extract_d_p(source: str, domain_out: str, problem_out: str) -> Tuple[str, str]:
    domain_text = _extract(source, "(define (domain")
    problem_text = _extract(source, "(define (problem")

    Path(domain_out).write_text(domain_text, encoding="utf-8")
    Path(problem_out).write_text(problem_text, encoding="utf-8")

    return domain_text, problem_text


def query_to_pddl(agent: object, query: str, d_out: str, p_out: str) -> Tuple[str, str]:
    response = agent.invoke({"messages": [{"role": "user", "content": query}]})
    resp_text = response["messages"][-1].content
    domain_out = d_out
    problem_out = p_out
    return extract_d_p(resp_text, domain_out, problem_out)


def run_ff(domain: str, problem: str, ff_loc: str) -> str:
    cmd = ["wsl", ff_loc, "-o", domain, "-f", problem]
    result = subprocess.run(cmd, capture_output=True, text=True)
    # if result.returncode != 0:
    # return result.stderr
    return result.stdout
