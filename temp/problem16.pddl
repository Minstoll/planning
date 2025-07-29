(define (problem blocksworld-problem)
  (:domain blocksworld)

  (:objects
    A B C D E F G H I K L - block)

  (:init
    (handempty)
    (clear A) (clear B) (clear C) (clear D) 
    (clear E) (clear F) (clear G) (clear H) 
    (clear I) (clear K) (clear L)
    (ontable A) (ontable B) (ontable C) (ontable D) 
    (ontable E) (ontable F) (ontable G) (ontable H)
    (ontable I) (ontable K) (ontable L))

  (:goal (and
    (on A I)
    (on B C)
    (on C G)
    (on D A)
    (on E B)
    (on F L)
    (on G H)
    (on H F)
    (on I K)
    (on K E)))
)