(define (domain block-stacking)
    (:requirements :strips :typing)

    (:types block)

    (:predicates
        (clear ?b - block)
        (on ?b1 - block ?b2 - block)
        (ontable ?b - block)
        (holding ?b - block)
        (handempty)
    )

    (:action pick-up
        :parameters (?b - block)
        :precondition (and (clear ?b) (ontable ?b) (handempty))
        :effect (and
            (holding ?b)
            (not (clear ?b))
            (not (ontable ?b))
            (not (handempty)))
    )

    (:action put-down
        :parameters (?b - block)
        :precondition (holding ?b)
        :effect (and
            (ontable ?b)
            (clear ?b)
            (handempty)
            (not (holding ?b)))
    )

    (:action stack
        :parameters (?b1 - block ?b2 - block)
        :precondition (and (holding ?b1) (clear ?b2))
        :effect (and
            (on ?b1 ?b2)
            (clear ?b1)
            (handempty)
            (not (holding ?b1))
            (not (clear ?b2)))
    )

    (:action unstack
        :parameters (?b1 - block ?b2 - block)
        :precondition (and (on ?b1 ?b2) (clear ?b1) (handempty))
        :effect (and
            (holding ?b1)
            (clear ?b2)
            (not (on ?b1 ?b2))
            (not (clear ?b1))
            (not (handempty)))
    )
)