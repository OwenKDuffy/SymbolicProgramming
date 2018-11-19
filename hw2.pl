%pt1

% u2v --> [], u(0).
% u(CNT+1) --> [0], u(CNT).
% u(CNT-2) --> [1], u(CNT).
% u(CNT) --> [2], v(CNT).
% v(CNT+1) --> [0], v(CNT).
% v(CNT-2) --> [1], v(CNT).
% v(0) --> [].
u2v --> s(CNTU), [2], s(CNTV), {(abs(CNTU - CNTV)) =:= 0}.
s(NEWCNT) --> [0], s(CNT), {NEWCNT is CNT + 1}.
s(NEWCNT) --> [1], s(CNT), {NEWCNT is CNT - 2}.
s(_) --> [].

%pt2
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

%pt3

sum(N) --> [N].
sum(N) --> {between(1, N, V), R is N - V}, [V], sum(R).
