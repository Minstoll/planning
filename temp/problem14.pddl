(define (problem block-stacking-problem)
  (:domain block-stacking)

  (:objects 
    E G L
  )

  (:init 
    (hand-empty)
    (clear E) 
    (clear G) 
    (clear L) 
    (on-table E) 
    (on-table G) 
    (on-table L)
  )

  (:goal 
    (and
      (on E G)
      (on L E)
    )
  )
)