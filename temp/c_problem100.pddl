(define (problem block-stacking-problem)
  (:domain block-stacking)
  (:objects
    A B C D E F G H - block
  )

  (:init
    (hand-empty)
    (consonant A) (consonant B) (consonant C) (consonant D) (consonant F) (consonant G) (consonant H)
    (clear C) 
    (clear D)
    (clear E)
    (on C G)
    (on E H)
    (on F B)
    (on G A)
    (on H F)
    (on-table A)
    (on-table B)
    (on-table D)
  )

  (:goal
    (and 
      (on A E)
      (on C G)
      (on D A)
      (on F C)
      (on G H)
      (on H B)
    )
  )
)