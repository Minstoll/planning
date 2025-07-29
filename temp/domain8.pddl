(define (domain block-stacking)
  (:requirements :strips)
  
  (:predicates
    (clear ?x)
    (on ?x ?y)
    (ontable ?x)
    (emptyhand)
    (holding ?x)
  )

  (:action pick-up
    :parameters (?block)
    :precondition (and (ontable ?block) (clear ?block) (emptyhand))
    :effect (and
              (not (ontable ?block))
              (not (clear ?block))
              (not (emptyhand))
              (holding ?block))
  )

  (:action put-down
    :parameters (?block)
    :precondition (holding ?block)
    :effect (and
              (ontable ?block)
              (clear ?block)
              (emptyhand)
              (not (holding ?block)))
  )

  (:action stack
    :parameters (?block ?under)
    :precondition (and (holding ?block) (clear ?under))
    :effect (and
              (not (holding ?block))
              (not (clear ?under))
              (clear ?block)
              (emptyhand)
              (on ?block ?under))
  )

  (:action unstack
    :parameters (?block ?under)
    :precondition (and (on ?block ?under) (clear ?block) (emptyhand))
    :effect (and
              (holding ?block)
              (clear ?under)
              (emptyhand)
              (not (clear ?block))
              (not (on ?block ?under)))
  )
)