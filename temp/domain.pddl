(define (domain block-world)
  (:requirements :strips :typing)
  (:types block)
  
  (:predicates
    (clear ?b - block)
    (on-table ?b - block)
    (holding ?b - block)
    (empty-hand)
    (on ?b1 - block ?b2 - block)
  )
  
  (:action pick-up
    :parameters (?b - block)
    :precondition (and (clear ?b) (on-table ?b) (empty-hand))
    :effect (and (not (on-table ?b)) (holding ?b) (not (clear ?b)) (not (empty-hand)))
  )
  
  (:action put-down
    :parameters (?b - block)
    :precondition (holding ?b)
    :effect (and (on-table ?b) (clear ?b) (empty-hand) (not (holding ?b)))
  )
  
  (:action unstack
    :parameters (?b1 - block ?b2 - block)
    :precondition (and (on ?b1 ?b2) (clear ?b1) (empty-hand))
    :effect (and (holding ?b1) (clear ?b2) (not (clear ?b1)) (not (on ?b1 ?b2)) (not (empty-hand)))
  )
  
  (:action stack
    :parameters (?b1 - block ?b2 - block)
    :precondition (and (holding ?b1) (clear ?b2))
    :effect (and (on ?b1 ?b2) (not (holding ?b1)) (clear ?b1) (not (clear ?b2)) (empty-hand))
  )
)