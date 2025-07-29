(define (domain block-stacking)
  (:predicates
    (clear ?x)            ; ?x is clear
    (on-table ?x)         ; ?x is on the table
    (on ?x ?y)            ; ?x is on ?y
    (holding ?x)          ; holding ?x
    (handempty)           ; hand is empty
  )

  (:action pick-up
    :parameters (?x)
    :precondition (and (handempty) (clear ?x) (on-table ?x))
    :effect (and (holding ?x) (not (handempty)) (not (clear ?x)) (not (on-table ?x)))
  )

  (:action put-down
    :parameters (?x)
    :precondition (holding ?x)
    :effect (and (handempty) (on-table ?x) (clear ?x) (not (holding ?x)))
  )

  (:action unstack
    :parameters (?x ?y)
    :precondition (and (handempty) (clear ?x) (on ?x ?y))
    :effect (and (holding ?x) (clear ?y) (not (handempty)) (not (clear ?x)) (not (on ?x ?y)))
  )

  (:action stack
    :parameters (?x ?y)
    :precondition (and (holding ?x) (clear ?y))
    :effect (and (handempty) (on ?x ?y) (clear ?x) (not (holding ?x)) (not (clear ?y)))
  )
)