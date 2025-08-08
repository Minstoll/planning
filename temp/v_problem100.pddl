(define (problem block-arrangement)
  (:domain blockstacking)
  (:objects
    A B C D E F G H - block
  )
  (:init
    (hand-empty)
	
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

    (vowel A)
    (vowel E)
    (vowel I)
    (vowel O)
    (vowel U)
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