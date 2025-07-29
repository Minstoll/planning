(define (problem arrange-blocks)
  (:domain blocksworld)

  (:objects A B D F H - block)

  (:init
    (clear A)
    (clear B)
    (clear D)
    (clear F)
    (clear H)
    (ontable A)
    (ontable B)
    (ontable D)
    (ontable F)
    (ontable H)
    (handempty)
  )

  (:goal
    (and
      (on A B)
      (on B H)
      (on D F)
      (on H D)
    )
  )
)