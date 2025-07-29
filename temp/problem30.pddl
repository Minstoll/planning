(define (problem blockworld-task)
  (:domain blockworld)
  (:objects
    A B C D E F G I L - block
  )
  
  (:init
    (handempty)
    (clear A) (ontable A)
    (clear B) (ontable B)
    (clear C) (ontable C)
    (clear D) (ontable D)
    (clear E) (ontable E)
    (clear F) (ontable F)
    (clear G) (ontable G)
    (clear I) (ontable I)
    (clear L) (ontable L)
  )
  
  (:goal
    (and
      (on A G)
      (on C B)
      (on D F)
      (on E D)
      (on F A)
      (on G C)
      (on I L)
      (on L E)
    )
  )
)