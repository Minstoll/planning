(define (problem block-stacking-problem)
  (:domain block-stacking)
  
  (:objects
    A C D F G H J K - block
  )
  
  (:init
    (handempty)
    (clear A) (clear C) (clear D) (clear F) (clear G) (clear H) (clear J) (clear K)
    (on-table A) (on-table C) (on-table D) (on-table F) (on-table G) (on-table H) (on-table J) (on-table K)
  )
  
  (:goal (and 
    (on C G)
    (on D K)
    (on F C)
    (on G A)
    (on H D)
    (on J H)
    (on K F)
  ))
)