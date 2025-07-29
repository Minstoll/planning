(define (problem blocksworld-problem)
  (:domain blocksworld)

  (:objects
    F I K L
  )

  (:init
    (handempty)
    (clear F)
    (clear I)
    (clear K)
    (clear L)
    (on-table F)
    (on-table I)
    (on-table K)
    (on-table L)
  )

  (:goal
    (and
      (on I K)
      (on K L)
      (on L F)
    )
  )
)