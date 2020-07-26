
(define (problem manyblockssmallpiles) (:domain blocks)
  (:objects
        b0 - block
	b1 - block
	b10 - block
	b11 - block
	b12 - block
	b13 - block
	b14 - block
	b15 - block
	b16 - block
	b17 - block
	b18 - block
	b19 - block
	b2 - block
	b20 - block
	b21 - block
	b22 - block
	b23 - block
	b24 - block
	b25 - block
	b26 - block
	b27 - block
	b28 - block
	b29 - block
	b3 - block
	b4 - block
	b5 - block
	b6 - block
	b7 - block
	b8 - block
	b9 - block
  )
  (:init 
	(clear b0)
	(clear b11)
	(clear b14)
	(clear b17)
	(clear b20)
	(clear b21)
	(clear b22)
	(clear b24)
	(clear b25)
	(clear b27)
	(clear b28)
	(clear b3)
	(clear b6)
	(clear b9)
	(handempty )
	(on b0 b1)
	(on b11 b12)
	(on b12 b13)
	(on b14 b15)
	(on b15 b16)
	(on b17 b18)
	(on b18 b19)
	(on b1 b2)
	(on b22 b23)
	(on b25 b26)
	(on b28 b29)
	(on b3 b4)
	(on b4 b5)
	(on b6 b7)
	(on b7 b8)
	(on b9 b10)
	(ontable b10)
	(ontable b13)
	(ontable b16)
	(ontable b19)
	(ontable b20)
	(ontable b21)
	(ontable b23)
	(ontable b24)
	(ontable b26)
	(ontable b27)
	(ontable b29)
	(ontable b2)
	(ontable b5)
	(ontable b8)
  )
  (:goal (and
	(on b5 b6)
	(on b6 b20)
	(on b20 b19)
	(on b19 b15)
	(on b15 b4)
	(ontable b4)
	(on b26 b21)
	(on b21 b18)
	(on b18 b12)
	(ontable b12)))
)