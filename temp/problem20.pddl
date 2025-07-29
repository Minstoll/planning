(define (problem arrange-blocks)
  (:domain block-stacking)
  (:objects B D F)
  (:init
    (handempty)
    (clear B)
    (clear D)
    (clear F)
    (on-table B)
    (on-table D)
    (on-table F)
  )
  (:goal
    (and
      (on B F)
      (on D B)
    )
  )
)