(define (problem block-stacking-problem)
  (:domain block-stacking)

  (:objects
    D E G J - object
    hand - object
  )

  (:init
    (empty hand)
    (clear D)
    (clear E)
    (clear G)
    (clear J)
    (on-table D)
    (on-table E)
    (on-table G)
    (on-table J)
  )

  (:goal
    (and
      (on D J)
      (on E D)
      (on G E)
    )
  )
)