(define (problem block-arrangement)
  (:domain blocks-world)
  (:objects A B C D E F H J K L)

  (:init
    (handempty)
    (clear A) (clear B) (clear C) (clear D) (clear E) (clear F) (clear H) (clear J) (clear K) (clear L)
    (on-table A) (on-table B) (on-table C) (on-table D) (on-table E) (on-table F) (on-table H) (on-table J) (on-table K) (on-table L)
  )

  (:goal
    (and
      (on A J)
      (on B C)
      (on C K)
      (on D F)
      (on E D)
      (on H A)
      (on J E)
      (on K L)
      (on L H)
    )
  )
)