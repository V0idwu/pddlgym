(define (problem blocks)
    (:domain blocks)
    (:objects
        b1 - block
        b2 - block
        b3 - block
        b4 - block
    )
    (:init
        (clear b1)
        (clear b2)
        (clear b3)
        (clear b4)
        (ontable b1)
        (ontable b2)
        (ontable b3)
        (ontable b4)
        (smaller b2 b1)
        (smaller b3 b1)
        (smaller b4 b1)
        (smaller b3 b2)
        (smaller b4 b2)
        (smaller b4 b3)
        (handempty)
    )
    (:goal
        (and (on b3 b4) (on b2 b3) (on b1 b2))
        ; (and (on b1 b2))
    )
)