(define (problem arrange-blocks)
  (:domain blocks)

  (:objects 
    E F K   ; the three blocks involved in this task
  )

  (:init
    (handempty)
    (clear E)
    (clear F)
    (clear K)
    (ontable E)
    (ontable F)
    (ontable K)
  )

  (:goal 
    (and
      (on F E)
      (on E K)
    )
  )
)