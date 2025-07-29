(define (problem blocks-problem)
  (:domain blockworld)

  (:objects
    A C F I J K ; The blocks
  )

  (:init
    (handempty)
    (clear A)
    (clear C)
    (clear F)
    (clear I)
    (clear J)
    (clear K)
    (ontable A)
    (ontable C)
    (ontable F)
    (ontable I)
    (ontable J)
    (ontable K)
  )

  (:goal
    (and
      (on A F)
      (on C I)
      (on F K)
      (on J A)
      (on K C)
    )
  )
)