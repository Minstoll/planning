(define (problem block-stacking-problem)
  (:domain block-stacking)

  (:objects
    A B C E G H I J K L
  )

  (:init
    (handempty)
    (clear A) (clear B) (clear C) (clear E) (clear G)
    (clear H) (clear I) (clear J) (clear K) (clear L)
    (on-table A) (on-table B) (on-table C) (on-table E)
    (on-table G) (on-table H) (on-table I) (on-table J)
    (on-table K) (on-table L)
  )

  (:goal (and
    (on A L)
    (on C K)
    (on E H)
    (on G A)
    (on H I)
    (on I B)
    (on J E)
    (on K G)
    (on L J)
  ))
)