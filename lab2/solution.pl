mestoBorovskogo(X):-
    permutation([5,4,3,2,1],[PA,PB,PK,PD,PE]),
    permutation([5,4,3,2,1],[CA,CB,CK,CD,CE]),
    permutation([5,4,3,2,1],[FA,FB,FK,FD,FE]),
    permutation([5,4,3,2,1],[SA,SB,SK,SD,SE]),
    permutation([5,4,3,2,1],[VA,VB,VK,VD,VE]),

    permutation([_,B,B,B,B],[PK,CK,FK,SK,VK]),

    SE =:= 6 - 1,
    VE =:= 6 - 3,
    ScA is PA + CA + FA + SA + VA,
    ScA = 24,
    PB+CB+FB+SB+VB<PA+CA+FA+SA+VA,
    PK+CK+FK+SK+VK<PB+CB+FB+SB+VB,
    PD+CD+FD+SD+VD<PK+CK+FK+SK+VK,
    PE+CE+FE+SE+VE<PD+CD+FD+SD+VD,
    !,
    X is 6- SB.
