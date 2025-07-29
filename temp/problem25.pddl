(define (problem block-stacking-problem)
  (:domain block-stacking)

  (:objects A C J)

  (:init
    (handempty)
    (clear A) (clear C) (clear J)
    (on-table A) (on-table C) (on-table J)
  )

  (:goal
    (and 
      (on A C)
      (on J A)
    )
  )
)