(define (problem block-stacking-problem)
  (:domain block-stacking)
  
  (:objects
    A B C D E F G J K L
  )
  
  (:init
    (hand-empty)
    (clear A) (clear B) (clear C) 
    (clear D) (clear E) (clear F)
    (clear G) (clear J) (clear K)
    (clear L)
    (on-table A) (on-table B) (on-table C)
    (on-table D) (on-table E) (on-table F)
    (on-table G) (on-table J) (on-table K)
    (on-table L)
  )
  
  (:goal
    (and
      (on A D) (on B F) (on C L) 
      (on D E) (on F J) (on G K) 
      (on J C) (on K A) (on L G)
    )
  )
)