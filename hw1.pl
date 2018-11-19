pterm(null).
pterm(f0(X)) :- pterm(X).
pterm(f1(X)) :- pterm(X).

incr(null, f1(null)).
% incr(f0(null), f1(null)).
incr(X, Y) :- X = f0(Z), Y = f1(Z);
                X = f1(Z), Y = f0(W), incr(Z, W).


legal(f0(null)).
legal(X) :- recursiveLegal(X, f1(null)).

recursiveLegal(X, X).
recursiveLegal(X, Y) :-  incr(Y, Z), recursiveLegal(X, Z).

% msb1(Y) :- Y = f1(null);
            % revers(Y, f1(_)).



incrR(X, Y) :- legal(X), incr(X, Y).


add(X, f0(null), X).
add(X, Y, Z) :- incr(W, Y), add(X, W, V), incr(V, Z).

mult(f0(null), _, f0(null)).
mult(_ f0(null),f0(null)).
mult(X, f1(null), X).
mult(X, Y, Z) :- incr(W, Y), mult(X, W, V), add(X, V, Z).

revers(P, RevP) :- recursiveRev(P, RevP, null).

recursiveRev(P, RevP, Acc) :- P = null, RevP = Acc;
                                P = f0(X), recursiveRev(X, RevP, f0(Acc));
                                P = f1(X), recursiveRev(X, RevP, f1(Acc)).


normalize(P, Pn) :- revers(P, Rpn), deleteZeroes(Rpn, Ans), revers(Ans, Pn).

deleteZeroes(f1(X), f1(X)).
deleteZeroes(f0(X), ANS) :- deleteZeroes(X, ANS);

enc(null) := 0.
enc(f0(X)) := 2 * enc(X).
enc(f1(X)) := 2 * enc(X) + 1.


% test add inputting numbers N1 and N2
testAdd(N1,N2,T1,T2,Sum,SumT) :- numb2pterm(N1,T1), numb2pterm(N2,T2),
add(T1,T2,SumT), pterm2numb(SumT,Sum).

% test mult inputting numbers N1 and N2
testMult(N1,N2,T1,T2,N1N2,T1T2) :- numb2pterm(N1,T1), numb2pterm(N2,T2),
mult(T1,T2,T1T2), pterm2numb(T1T2,N1N2).
% test revers inputting list L
testRev(L,Lr,T,Tr) :- ptermlist(T,L), revers(T,Tr), ptermlist(Tr,Lr).
% test normalize inputting list L
testNorm(L,T,Tn,Ln) :- ptermlist(T,L), normalize(T,Tn), ptermlist(Tn,Ln).
% make a pterm T from a number N numb2term(+N,?T)
numb2pterm(0,f0(null)).
numb2pterm(N,T) :- N>0, M is N-1, numb2pterm(M,Temp), incr(Temp,T).
% make a number N from a pterm T pterm2numb(+T,?N)
pterm2numb(null,0).
pterm2numb(f0(X),N) :- pterm2numb(X,M), N is 2*M.
pterm2numb(f1(X),N) :- pterm2numb(X,M), N is 2*M +1.
% reversible ptermlist(T,L)
ptermlist(null,[]).
ptermlist(f0(X),[0|L]) :- ptermlist(X,L).
ptermlist(f1(X),[1|L]) :- ptermlist(X,L).
