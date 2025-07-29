(define (problem block-stacking-problem)
  (:domain block-stacking)
  (:objects A B D E F G H I K L - block)
  
  (:init
    (clear A) (clear B) (clear D) (clear E) (clear F) (clear G) (clear H) (clear I) (clear K) (clear L)
    (on-table A) (on-table B) (on-table D) (on-table E) (on-table F) (on-table G) (on-table H) (on-table I) (on-table K) (on-table L)
    (handempty))
  
  (:goal
    (and (on B G)
         (on D I)
         (on E A)
         (on F L)
         (on G E)
         (on H F)
         (on I H)
         (on K B)
         (on L K)))
)