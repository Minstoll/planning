(define (problem stack-problem)
    (:domain block-stacking)

    (:objects
        A B C D E F G H I J K L - block
    )

    (:init
        (handempty)
        ; All blocks are initially clear and on the table
        (clear A) (ontable A)
        (clear B) (ontable B)
        (clear C) (ontable C)
        (clear D) (ontable D)
        (clear E) (ontable E)
        (clear F) (ontable F)
        (clear G) (ontable G)
        (clear H) (ontable H)
        (clear I) (ontable I)
        (clear J) (ontable J)
        (clear K) (ontable K)
        (clear L) (ontable L)
    )

    (:goal
        (and
            (on A F)
            (on B D)
            (on C I)
            (on E J)
            (on F B)
            (on G A)
            (on H E)
            (on I K)
            (on J G)
            (on K L)
            (on L H)
        )
    )
)