(define (problem combined-block-arrangement)
  (:domain combined-blockstacking)

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
    ; Note: Assuming I, O, U are vocal letters needing to be declared but not existing in objects
    ;(vowel I)
    ;(vowel O)
    ;(vowel U)

    ;(consonant A)
    (consonant B)
    (consonant C)
    (consonant D)
    (consonant F)
    (consonant G)
    (consonant H)
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