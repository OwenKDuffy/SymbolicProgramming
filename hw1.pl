pterm(null).
pterm(f0(X)) :- pterm(X).
pterm(f1(X)) :- pterm(X).

incr(null, f1(null)).
incr(f0(null), f1(null)).
incr(X, Y) :- X = f0(Z), Y = f1(Z), incr(_, Z);
                X = f1(Z), Y = f0(W), incr(Z, W).


% legal(X) :- incr(X, _), X \= null.
