
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
	b4 - block
	b5 - block
	b6 - block
	b7 - block
	b8 - block
	b9 - block
  )
  (:init 
	(clear b0)
	(clear b10)
	(clear b11)
	(clear b14)
	(clear b15)
	(clear b17)
	(clear b18)
	(clear b19)
	(clear b21)
	(clear b22)
	(clear b23)
	(clear b25)
	(clear b26)
	(clear b29)
	(clear b2)
	(clear b30)
	(clear b3)
	(clear b6)
	(clear b7)
	(clear b8)
	(handempty )
	(on b0 b1)
	(on b11 b12)
	(on b12 b13)
	(on b15 b16)
	(on b19 b20)
	(on b23 b24)
	(on b26 b27)
	(on b27 b28)
	(on b3 b4)
	(on b4 b5)
	(on b8 b9)
	(ontable b10)
	(ontable b13)
	(ontable b14)
	(ontable b16)
	(ontable b17)
	(ontable b18)
	(ontable b1)
	(ontable b20)
	(ontable b21)
	(ontable b22)
	(ontable b24)
	(ontable b25)
	(ontable b28)
	(ontable b29)
	(ontable b2)
	(ontable b30)
	(ontable b5)
	(ontable b6)
	(ontable b7)
	(ontable b9)
  )
  (:goal (and
	(on b9 b29)
	(on b29 b20)
	(on b20 b0)
	(ontable b0)
	(on b21 b25)
	(on b25 b16)
	(on b16 b11)
	(ontable b11)))
)
