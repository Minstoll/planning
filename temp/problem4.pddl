(define (problem stacking-task)
  (:domain blocksworld)

  (:objects
    B F G J ; listing the blocks
  )

  (:init
    (handempty)
    (clear B)
    (clear F)
    (clear G)
    (clear J)
    (on-table B)
    (on-table F)
    (on-table G)
    (on-table J)
  )

  (:goal
    (and
      (on F B)
      (on G J)
      (on J F)
    )
  )
)