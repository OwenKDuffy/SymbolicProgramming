pterm(null).
pterm(f0(X)) :- pterm(X).
pterm(f1(X)) :- pterm(X).

incr(null, f1(null)).
incr(f0(null), f1(null)).
incr(X, Y) :- X = f0(Z), Y = f1(Z), incr(_, Z);
                X = f1(Z), Y = f0(W), incr(Z, W).


legal(X) :- X = f0(null);
            msb1(X).

msb1(Y) :- Y = f1(null);
            Y = f0(X), X \== null, msb1(X);
            Y = f1(X), X \== null, msb1(X).



incrR(X, Y) :- legal(X), legal(Y), incr(X, Y).


add(X, Y, Z) :- Y = f0(null), X = Z;
                incr(X, W), incr(V, Y), add(W, V, Z).

mult(X, Y, Z) :- recursiveMul(X, Y, Z, 0).

recursiveMul(Init, Itr, RES, Acc) :- Itr = f1(null), Acc = RES;
                        add(Acc, Init, E), incr(F, Itr), recursiveMul(Init, F, RES, E).

revers(P, RevP) :- recursiveRev(P, RevP, null).

recursiveRev(P, RevP, Acc) :- P = null, RevP = Acc;
                                P = f0(X), recursiveRev(X, RevP, f0(Acc));
                                P = f1(X), recursiveRev(X, RevP, f1(Acc)).


enc(null) := 0.
enc(f0(X)) := 2 * enc(X).
enc(f1(X)) := 2 * enc(X) + 1.
