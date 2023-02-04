(define (problem blocks)
    (:domain blocks)
    (:objects
        
        b - block
        a - block
        c - block
        d - block
        e - block
        f - block
        g - block
        h - block
        i - block
    )
    (:init
        (clear a)
        (clear b)
        (clear c)
        (clear d)
        (clear e)
        (clear f)
        (clear g)
        (clear h)
        (clear i)
        (ontable a)
        (ontable b)
        (ontable c)
        (ontable d)
        (ontable e)
        (ontable f)
        (ontable g)
        (ontable h)
        (ontable i)
        (handempty)

    )
    (:goal (and (on i h) (on h g) (on g f) (on f e) (on e d) (on d c) (on c b) (on b a)))
)
