(define (problem block-world-problem)
  (:domain block-world)
  
  (:objects
    B D F G H I J L - block
  )
  
  (:init
    (clear B) (clear D) (clear F) (clear G) (clear H) (clear I) (clear J) (clear L)
    (on-table B) (on-table D) (on-table F) (on-table G) (on-table H) (on-table I) (on-table J) (on-table L)
    (empty-hand)
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