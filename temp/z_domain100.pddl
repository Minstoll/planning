(define (domain combined-blockstacking)
  (:requirements :strips :typing :equality)

  (:types block)

  (:predicates 
    (clear ?b - block)
    (on-table ?b - block)
    (on ?b1 - block ?b2 - block)
    (holding ?b - block)
    (hand-empty)
    (vowel ?b - block)
    (consonant ?b - block)
  )
  
  ; Agent 1 actions
  (:action pick-up-vowel
    :parameters (?b - block)
    :precondition (and (vowel ?b) (clear ?b) (on-table ?b) (hand-empty))
    :effect (and (holding ?b) (not (clear ?b)) (not (on-table ?b)) (not (hand-empty)))
  )

  (:action stack-vowel
    :parameters (?b1 - block ?b2 - block)
    :precondition (and (vowel ?b1) (vowel ?b2) (clear ?b2) (holding ?b1))
    :effect (and (on ?b1 ?b2) (clear ?b1) (hand-empty) (not (holding ?b1)) (not (clear ?b2)))
  )

  (:action unstack-vowel
    :parameters (?b1 - block ?b2 - block)
    :precondition (and (vowel ?b1) (vowel ?b2) (on ?b1 ?b2) (clear ?b1) (hand-empty))
    :effect (and (holding ?b1) (clear ?b2) (not (on ?b1 ?b2)) (not (clear ?b1)) (not (hand-empty)))
  )

  ; Agent 2 actions
  (:action pick-up-consonant
    :parameters (?b - block)
    :precondition (and (consonant ?b) (clear ?b) (hand-empty) (on-table ?b))
    :effect (and (holding ?b) (not (hand-empty)) (not (on-table ?b)) (not (clear ?b)))
  )

  (:action stack-consonant
    :parameters (?b1 - block ?b2 - block)
    :precondition (and (holding ?b1) (consonant ?b2) (clear ?b2))
    :effect (and (hand-empty) (not (clear ?b2)) (clear ?b1) (on ?b1 ?b2) (not (holding ?b1)))
  )

  (:action unstack-consonant
    :parameters (?b1 - block ?b2 - block)
    :precondition (and (consonant ?b1) (on ?b1 ?b2) (hand-empty) (clear ?b1))
    :effect (and (holding ?b1) (not (hand-empty)) (not (on ?b1 ?b2)) (clear ?b2))
  )

  ; Common action
  (:action put-down
    :parameters (?b - block)
    :precondition (holding ?b)
    :effect (and (clear ?b) (hand-empty) (on-table ?b) (not (holding ?b)))
  )
)