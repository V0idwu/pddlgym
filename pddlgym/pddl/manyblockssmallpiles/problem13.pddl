
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
	b30 - block
	b31 - block
	b4 - block
	b5 - block
	b6 - block
	b7 - block
	b8 - block
	b9 - block
  )
  (:init 
	(clear b0)
	(clear b12)
	(clear b13)
	(clear b15)
	(clear b16)
	(clear b19)
	(clear b20)
	(clear b21)
	(clear b24)
	(clear b26)
	(clear b29)
	(clear b3)
	(clear b6)
	(clear b9)
	(handempty )
	(on b0 b1)
	(on b10 b11)
	(on b13 b14)
	(on b16 b17)
	(on b17 b18)
	(on b1 b2)
	(on b21 b22)
	(on b22 b23)
	(on b24 b25)
	(on b26 b27)
	(on b27 b28)
	(on b29 b30)
	(on b30 b31)
	(on b3 b4)
	(on b4 b5)
	(on b6 b7)
	(on b7 b8)
	(on b9 b10)
	(ontable b11)
	(ontable b12)
	(ontable b14)
	(ontable b15)
	(ontable b18)
	(ontable b19)
	(ontable b20)
	(ontable b23)
	(ontable b25)
	(ontable b28)
	(ontable b2)
	(ontable b31)
	(ontable b5)
	(ontable b8)
  )
  (:goal (and
	(on b31 b7)
	(on b7 b6)
	(on b6 b23)
	(ontable b23)
	(on b0 b24)
	(on b24 b1)
	(on b1 b16)
	(on b16 b9)
	(ontable b9)))
)