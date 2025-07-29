(define (problem block-stacking-problem)
  (:domain block-stacking)
  
  (:objects 
    A D E F H I J
  )
  
  (:init
    (clear A) (clear D) (clear E) (clear F) (clear H) (clear I) (clear J)
    (ontable A) (ontable D) (ontable E) (ontable F) (ontable H) (ontable I) (ontable J)
    (emptyhand)
  )
  
  (:goal
    (and
      (on D F)
      (on E H)
      (on F I)
      (on H D)
      (on I A)
      (on J E)
    )
  )
)