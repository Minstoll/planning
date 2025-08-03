(define (problem block-stacking-problem)
  (:domain block-stacking)

  (:objects B D F G H I J L)

  (:init
    (handempty)
    (clear B) (ontable B)
    (clear D) (ontable D)
    (clear F) (ontable F)
    (clear G) (ontable G)
    (clear H) (ontable H)
    (clear I) (ontable I)
    (clear J) (ontable J)
    (clear L) (ontable L)
  )

  (:goal
    (and
      (on B H)
      (on D B)
      (on F I)
      (on G D)
      (on H L)
      (on I G)
      (on J F)
    )
  )
)