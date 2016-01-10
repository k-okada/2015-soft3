safe([Qt | Qr]) :- not(attack(Qt, Qr)), safe(Qr).
safe([]).

attack(X, Xs) :- attack_sub(X, 1, Xs).
attack_sub(X, N, [Y|Ys]) :- (X =:= Y + N ; X =:= Y - N).
attack_sub(X, N, [Y|Ys]) :- N1 is N + 1, attack_sub(X, N1, Ys).

queen_f(Q) :- queen_sub([1,2,3,4,5,6,7,8], [], Q).

queen_sub(L, SafeQs, Q) :-
        select(X, L, RestQs),
        not(attack(X, SafeQs)),
        queen_sub(RestQs, [X | SafeQs], Q).
queen_sub([], Q, Q).
