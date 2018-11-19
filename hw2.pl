

u2v --> [], u(0).
u(CNT) --> [2], v(CNT).
u(CNT) --> [0], u(succ(CNT)).
u(CNT) --> [1], u(CNT).
v(0) --> [].
v(CNT) --> [0], v(CNT).
v(succ(succ(CNT))) --> [1], v(CNT).




road --> house, house, house.
house --> col, nat, pet.

col --> [red].
col --> [blue].
col --> [green].

nat --> [english].
nat --> [japanese].
nat --> [spanish].

pet --> [snail].
pet --> [jaguar].
pet --> [zebra].
