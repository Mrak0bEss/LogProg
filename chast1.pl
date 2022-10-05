mylen([],0).
mylen([X|T],N) :- mylen(T,N1), N is N1+1.

remove(X, [X|T], T).
remove(X, [Y|T], [Y|T1]) :- remove(X, T, T1).

length(L, Length):-length(L, 0, Length).
length([], Length, Length):-!.
length([_|T], Y, Length):- Res is Y + 1, length(T, Res, Length).


member(H, [H|_]) :- !.
member(H, [_|T]) :- member(H, T).


sublist([], []).
sublist([H|L1], [H|L2]) :-sublist(L1, L2).
sublist(H, [_|L2]) :-sublist(H, L2).


append([], L, L).
append([H|T], List, [H|TRes]):- append(T, List, TRes).


permute([], []).
permute(L, [X|T]):-remove(X, L, L1), permute(L1, T).

%1
n_num_rec([H|_],0,H) :-
    !.
n_num_rec([_|T],N,H) :-
    N > 0, 
    N1 is N-1,
    n_num_rec(T,N1,H).


n_num( List, N, H) :-
    append(L1, [H|_], List),
    mylen(L1, N),
    !.




%2
arithm([X,Y,Z|T]) :-
    !,
    X - Y =:= Y - Z,
    arithm([Y,Z|T]).
arithm(_).