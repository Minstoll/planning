(define (domain block-stacking)
  (:requirements :strips :typing)

  (:types block)

  (:predicates
    (clear ?b - block)
    (on-table ?b - block)
    (holding ?b - block)
    (hand-empty)
    (on ?b1 - block ?b2 - block)
    (consonant ?b - block)
  )

  (:action pick-up
    :parameters (?b - block)
    :precondition (and (consonant ?b) (clear ?b) (hand-empty) (on-table ?b))
    :effect (and (holding ?b) (not (hand-empty)) (not (on-table ?b)) (not (clear ?b)))
  )

  (:action put-down
    :parameters (?b - block)
    :precondition (holding ?b)
    :effect (and (hand-empty) (clear ?b) (on-table ?b) (not (holding ?b)))
  )

  (:action stack
    :parameters (?b1 - block ?b2 - block)
    :precondition (and (holding ?b1) (consonant ?b2) (clear ?b2))
    :effect (and (hand-empty) (not (clear ?b2)) (clear ?b1) (on ?b1 ?b2) (not (holding ?b1)))
  )

  (:action unstack
    :parameters (?b1 - block ?b2 - block)
    :precondition (and (consonant ?b1) (on ?b1 ?b2) (hand-empty) (clear ?b1))
    :effect (and (holding ?b1) (hand-empty) (not (on ?b1 ?b2)) (not (clear ?b1)) (clear ?b2))
  )
)