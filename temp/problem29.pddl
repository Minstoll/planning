(define (problem block-problem)
  (:domain blocksworld)

  (:objects
    A C D F G I J L
  )

  (:init
    (hand-empty)
    (clear A)
    (clear C)
    (clear D)
    (clear F)
    (clear G)
    (clear I)
    (clear J)
    (clear L)
    (on-table A)
    (on-table C)
    (on-table D)
    (on-table F)
    (on-table G)
    (on-table I)
    (on-table J)
    (on-table L)
  )

  (:goal
    (and
      (on A I)
      (on D A)
      (on F D)
      (on C F)
      (on G C)
      (on I J)
      (on J L)
    )
  )
)