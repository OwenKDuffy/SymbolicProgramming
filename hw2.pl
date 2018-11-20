%pt1

u2v --> [], u(0).
u(CNT) --> [2], v(CNT).
u(CNT) --> [0], u(succ(CNT)).
u(CNT) --> [1], u(CNT).
v(0) --> [].
v(CNT) --> [0], v(CNT).
v(succ(succ(CNT))) --> [1], v(CNT).
% u2v --> u(CNT), [2], v(2 * CNT).
%
%
% u(0) --> [].
% u(NEWCNT) --> [0], u(CNT), {NEWCNT is CNT + 1}.
% u(CNT) --> [1], u(CNT).
%
% v(0) --> [].
% v(CNT) --> [0], v(CNT).
% v(NEWCNT) --> [1], v(CNT), {NEWCNT is CNT + 1}.

%pt2
street --> house(A, B, C), house(D, E, F), house(G, H, I),
        {A \== D, A \== G, D \== G,
         B \== E, B \== H, E \== H,
         C \== F, C \== I, F \== I}.

house(X, Y, Z) --> col(X), nat(Y), pet(Z).

col(red) --> [red].
col(blue) --> [blue].
col(green) --> [green].

nat(english) --> [english].
nat(japanese) --> [japanese].
nat(spanish) --> [spanish].

pet(snail) --> [snail].
pet(jaguar) --> [jaguar].
pet(zebra) --> [zebra].

%pt3

sum(N) --> [N].
sum(N) --> {between(1, N, V), R is N - V}, [V], sum(R).
