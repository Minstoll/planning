(define (problem block-stacking-problem)
  (:domain block-stacking)
  (:objects
    A B D E F
  )
  (:init
    (handempty)
    (clear A)
    (clear B)
    (clear D)
    (clear E)
    (clear F)
    (on-table A)
    (on-table B)
    (on-table D)
    (on-table E)
    (on-table F)
  )
  (:goal
    (and
      (on A B)
      (on B F)
      (on D E)
      (on E A)
    )
  )
)