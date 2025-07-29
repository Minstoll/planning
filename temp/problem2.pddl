(define (problem block-stacking-problem)
  (:domain block-stacking)

  (:objects A B G H I J K)

  (:init
    (handempty)
    (clear A) (clear B) (clear G) (clear H) 
    (clear I) (clear J) (clear K)
    (on-table A) (on-table B) (on-table G)
    (on-table H) (on-table I) (on-table J) 
    (on-table K)
  )

  (:goal (and
    (on A B)
    (on B K)
    (on G A)
    (on H I)
    (on J G)
    (on K H)
  ))
)