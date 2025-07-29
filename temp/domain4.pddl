(define (domain blocksworld)
  (:predicates
    (clear ?x)             ; whether a block is clear
    (on-table ?x)          ; whether a block is on the table
    (on ?x ?y)             ; whether block x is on block y
    (holding ?x)           ; whether a block is being held
    (handempty)            ; whether the hand is empty
  )

  (:action pick-up
    :parameters (?x)
    :precondition (and (clear ?x) (on-table ?x) (handempty))
    :effect (and (not (on-table ?x)) (not (handempty)) (holding ?x))
  )

  (:action put-down
    :parameters (?x)
    :precondition (holding ?x)
    :effect (and (handempty) (not (holding ?x)) (on-table ?x) (clear ?x))
  )

  (:action stack
    :parameters (?x ?y)
    :precondition (and (holding ?x) (clear ?y))
    :effect (and (not (holding ?x)) (not (clear ?y)) (handempty) (on ?x ?y) (clear ?x))
  )

  (:action unstack
    :parameters (?x ?y)
    :precondition (and (on ?x ?y) (clear ?x) (handempty))
    :effect (and (holding ?x) (not (clear ?x)) (clear ?y) (not (on ?x ?y)) (not (handempty)))
  )
)