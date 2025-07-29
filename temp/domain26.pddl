(define (domain blocks)
  (:predicates 
    (on ?x ?y)                  ; block x is on block y
    (ontable ?x)                ; block x is on the table
    (clear ?x)                  ; block x is clear, nothing on top of it
    (holding ?x)                ; the hand is holding block x
    (handempty)                 ; the hand is empty
  )

  (:action pickup
    :parameters (?x)
    :precondition (and (ontable ?x) (clear ?x) (handempty))
    :effect (and (holding ?x)
                 (not (ontable ?x))
                 (not (clear ?x))
                 (not (handempty)))
  )

  (:action putdown
    :parameters (?x)
    :precondition (holding ?x)
    :effect (and (ontable ?x)
                 (clear ?x)
                 (handempty)
                 (not (holding ?x)))
  )

  (:action unstack
    :parameters (?x ?y)
    :precondition (and (on ?x ?y) (clear ?x) (handempty))
    :effect (and (holding ?x)
                 (clear ?y)
                 (not (on ?x ?y))
                 (not (clear ?x))
                 (not (handempty)))
  )

  (:action stack
    :parameters (?x ?y)
    :precondition (and (holding ?x) (clear ?y))
    :effect (and (on ?x ?y)
                 (handempty)
                 (clear ?x)
                 (not (holding ?x))
                 (not (clear ?y)))
  )
)