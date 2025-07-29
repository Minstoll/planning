(define (problem block-stacking)
  (:domain blockworld)

  (:objects
    B C F G K - block
  )

  (:init
    (clear B)
    (clear C)
    (clear F)
    (clear G)
    (clear K)
    (on-table B)
    (on-table C)
    (on-table F)
    (on-table G)
    (on-table K)
    (empty-hand)
  )

  (:goal
    (and
      (on B K)
      (on C B)
      (on G C)
      (on K F)
    )
  )
)