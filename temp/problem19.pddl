(define (problem blocks-problem)
  (:domain block-world)

  (:objects B D E F G H I J K L)

  (:init 
    (hand-empty)
    (clear B) (on-table B)
    (clear D) (on-table D)
    (clear E) (on-table E)
    (clear F) (on-table F)
    (clear G) (on-table G)
    (clear H) (on-table H)
    (clear I) (on-table I)
    (clear J) (on-table J)
    (clear K) (on-table K)
    (clear L) (on-table L)
  )

  (:goal
    (and 
      (on B K)
      (on D I)
      (on E D)
      (on G H)
      (on H F)
      (on I G)
      (on J B)
      (on K E)
      (on L J)
    )
  )
)