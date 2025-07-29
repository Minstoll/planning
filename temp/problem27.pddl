(define (problem blockstacking)
  (:domain blockstack)

  (:objects
    D E F G H K L - block
  )

  (:init
    (handempty)
    (clear D) (clear E) (clear F) (clear G) (clear H) (clear K) (clear L)
    (on-table D) (on-table E) (on-table F) (on-table G) (on-table H) (on-table K) (on-table L)
  )

  (:goal
    (and
      (on D H)
      (on E D)
      (on F K)
      (on H G)
      (on K L)
      (on L E)
    )
  )
)