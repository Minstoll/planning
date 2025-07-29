(define (domain block-stacking)
  (:requirements :strips)
  
  (:predicates
    (clear ?x)  ;; Block x is clear (nothing on top)
    (holding ?x)  ;; Hand is holding block x
    (on-table ?x)  ;; Block x is on the table
    (on ?x ?y)  ;; Block x is on block y
    (handempty)  ;; Hand is empty
  )

  (:action pick-up
    :parameters (?x)
    :precondition (and (clear ?x) (on-table ?x) (handempty))
    :effect (and (not (on-table ?x)) (not (handempty)) (holding ?x))
  )

  (:action put-down
    :parameters (?x)
    :precondition (holding ?x)
    :effect (and (on-table ?x) (not (holding ?x)) (handempty))
  )

  (:action stack
    :parameters (?x ?y)
    :precondition (and (holding ?x) (clear ?y))
    :effect (and (not (holding ?x)) (not (clear ?y)) (handempty) (on ?x ?y))
  )

  (:action unstack
    :parameters (?x ?y)
    :precondition (and (clear ?x) (on ?x ?y) (handempty))
    :effect (and (not (on ?x ?y)) (holding ?x) (handempty))
  )
)