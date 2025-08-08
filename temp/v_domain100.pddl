(define (domain blockstacking)
  (:requirements :strips :equality)
  (:predicates 
    (clear ?x)
    (on-table ?x)
    (on ?x ?y)
    (holding ?x)
    (hand-empty)
    (vowel ?x)
  )
  
  (:action pick-up
    :parameters (?x)
    :precondition (and (vowel ?x) (clear ?x) (on-table ?x) (hand-empty))
    :effect (and (holding ?x) (not (clear ?x)) (not (on-table ?x)) (not (hand-empty)))
  )

  (:action put-down
    :parameters (?x)
    :precondition (holding ?x)
    :effect (and (clear ?x) (hand-empty) (on-table ?x) (not (holding ?x)))
  )

  (:action stack
    :parameters (?x ?y)
    :precondition (and (vowel ?x) (vowel ?y) (clear ?y) (holding ?x))
    :effect (and (on ?x ?y) (clear ?x) (hand-empty) (not (holding ?x)) (not (clear ?y)))
  )

  (:action unstack
    :parameters (?x ?y)
    :precondition (and (vowel ?x) (vowel ?y) (on ?x ?y) (clear ?x) (hand-empty))
    :effect (and (holding ?x) (clear ?y) (not (on ?x ?y)) (not (clear ?x)) (not (hand-empty)))
  )
)