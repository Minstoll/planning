(define (domain block-stacking)
  (:requirements :strips :typing)
  
  (:predicates
    (clear ?x)
    (on-table ?x)
    (holding ?x)
    (handempty)
    (on ?x ?y))

  (:action pick-up
    :parameters (?x)
    :precondition (and (clear ?x) (on-table ?x) (handempty))
    :effect (and (holding ?x) (not (clear ?x)) (not (on-table ?x)) (not (handempty))))

  (:action put-down
    :parameters (?x)
    :precondition (holding ?x)
    :effect (and (clear ?x) (on-table ?x) (handempty) (not (holding ?x))))
  
  (:action stack
    :parameters (?x ?y)
    :precondition (and (holding ?x) (clear ?y))
    :effect (and (on ?x ?y) (clear ?x) (handempty) (not (holding ?x)) (not (clear ?y))))

  (:action unstack
    :parameters (?x ?y)
    :precondition (and (on ?x ?y) (clear ?x) (handempty))
    :effect (and (holding ?x) (clear ?y) (not (on ?x ?y)) (not (clear ?x))))
)