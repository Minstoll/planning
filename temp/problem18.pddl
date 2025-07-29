(define (problem block-stacking-problem)
  (:domain block-stacking)

  (:objects
    A C E G K L ; The blocks involved in the task
  )

  (:init
    (handempty)
    (clear A) (clear C) (clear E) (clear G) (clear K) (clear L)
    (ontable A) (ontable C) (ontable E) (ontable G) (ontable K) (ontable L)
  )

  (:goal
    (and
      (on A G)
      (on E L)
      (on G C)
      (on K E)
      (on L A)
    )
  )
)