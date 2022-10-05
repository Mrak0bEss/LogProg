group(102,['Petrov','Ivanovskij','Bitkoinov','SHarpin','Eksel','Tekstopisov','Kriptovalyutnikov','Azurin','Kruglotlichnikov']).
group(101,['Petrovskij','Sidorov','Myshin','Bezumnikov','Gustobukvennikova']).
group(104,['Ivanov','Zaporozhcev','Dzhavo','Full','Krugloschitalkin','Blokchejnis']).
group(103,['Sidorkin','Efirkina','Siplyusplyusov','Programmiro','Klaviaturnikova','Reshetnikov','Tekstopisova','Vebservisov']).
subject('Logicheskoe programmirovanie',[grade('Petrov',4),grade('Petrovskij',2),grade('Ivanov',5),grade('Ivanovskij',5),grade('Zaporozhcev',5),grade('Sidorov',2),grade('Sidorkin',4),grade('Bitkoinov',4),grade('Efirkina',3),grade('Siplyusplyusov',4),grade('Programmiro',4),grade('Dzhavo',2),grade('Klaviaturnikova',5),grade('Myshin',3),grade('Full',5),grade('Bezumnikov',5),grade('SHarpin',5),grade('Krugloschitalkin',4),grade('Reshetnikov',5),grade('Eksel',4),grade('Tekstopisov',4),grade('Tekstopisova',5),grade('Gustobukvennikova',5),grade('Kriptovalyutnikov',5),grade('Blokchejnis',3),grade('Azurin',5),grade('Vebservisov',5),grade('Kruglotlichnikov',3)]).
subject('Matematicheskij analiz',[grade('Petrov',2),grade('Petrovskij',4),grade('Ivanov',4),grade('Ivanovskij',4),grade('Zaporozhcev',4),grade('Sidorov',5),grade('Sidorkin',4),grade('Bitkoinov',5),grade('Efirkina',4),grade('Siplyusplyusov',5),grade('Programmiro',3),grade('Dzhavo',4),grade('Klaviaturnikova',3),grade('Myshin',5),grade('Full',4),grade('Bezumnikov',3),grade('SHarpin',4),grade('Krugloschitalkin',4),grade('Reshetnikov',5),grade('Eksel',3),grade('Tekstopisov',4),grade('Tekstopisova',4),grade('Gustobukvennikova',5),grade('Kriptovalyutnikov',4),grade('Blokchejnis',3),grade('Azurin',5),grade('Vebservisov',4),grade('Kruglotlichnikov',5)]).
subject('Funkcionalnoe programmirovanie',[grade('Petrov',3),grade('Petrovskij',5),grade('Ivanov',4),grade('Ivanovskij',3),grade('Zaporozhcev',3),grade('Sidorov',3),grade('Sidorkin',4),grade('Bitkoinov',5),grade('Efirkina',5),grade('Siplyusplyusov',5),grade('Programmiro',4),grade('Dzhavo',5),grade('Klaviaturnikova',5),grade('Myshin',5),grade('Full',4),grade('Bezumnikov',5),grade('SHarpin',3),grade('Krugloschitalkin',3),grade('Reshetnikov',4),grade('Eksel',4),grade('Tekstopisov',3),grade('Tekstopisova',4),grade('Gustobukvennikova',4),grade('Kriptovalyutnikov',5),grade('Blokchejnis',5),grade('Azurin',4),grade('Vebservisov',4),grade('Kruglotlichnikov',4)]).
subject('Informatika',[grade('Petrov',4),grade('Petrovskij',3),grade('Ivanov',3),grade('Ivanovskij',4),grade('Zaporozhcev',3),grade('Sidorov',4),grade('Sidorkin',4),grade('Bitkoinov',4),grade('Efirkina',3),grade('Siplyusplyusov',2),grade('Programmiro',4),grade('Dzhavo',5),grade('Klaviaturnikova',4),grade('Myshin',5),grade('Full',3),grade('Bezumnikov',4),grade('SHarpin',5),grade('Krugloschitalkin',5),grade('Reshetnikov',4),grade('Eksel',4),grade('Tekstopisov',3),grade('Tekstopisova',5),grade('Gustobukvennikova',3),grade('Kriptovalyutnikov',2),grade('Blokchejnis',4),grade('Azurin',5),grade('Vebservisov',4),grade('Kruglotlichnikov',4)]).
subject('Anglijskij yazyk',[grade('Petrov',4),grade('Petrovskij',5),grade('Ivanov',3),grade('Ivanovskij',4),grade('Zaporozhcev',4),grade('Sidorov',5),grade('Sidorkin',3),grade('Bitkoinov',5),grade('Efirkina',5),grade('Siplyusplyusov',5),grade('Programmiro',4),grade('Dzhavo',4),grade('Klaviaturnikova',3),grade('Myshin',5),grade('Full',4),grade('Bezumnikov',3),grade('SHarpin',4),grade('Krugloschitalkin',4),grade('Reshetnikov',2),grade('Eksel',4),grade('Tekstopisov',4),grade('Tekstopisova',5),grade('Gustobukvennikova',5),grade('Kriptovalyutnikov',5),grade('Blokchejnis',3),grade('Azurin',2),grade('Vebservisov',4),grade('Kruglotlichnikov',4)]).
subject('Psihologiya',[grade('Petrov',5),grade('Petrovskij',3),grade('Ivanov',3),grade('Ivanovskij',3),grade('Zaporozhcev',5),grade('Sidorov',3),grade('Sidorkin',5),grade('Bitkoinov',4),grade('Efirkina',5),grade('Siplyusplyusov',5),grade('Programmiro',3),grade('Dzhavo',4),grade('Klaviaturnikova',4),grade('Myshin',4),grade('Full',4),grade('Bezumnikov',2),grade('SHarpin',3),grade('Krugloschitalkin',2),grade('Reshetnikov',4),grade('Eksel',3),grade('Tekstopisov',3),grade('Tekstopisova',5),grade('Gustobukvennikova',4),grade('Kriptovalyutnikov',5),grade('Blokchejnis',5),grade('Azurin',3),grade('Vebservisov',5),grade('Kruglotlichnikov',4)]).

my_member(X, [X|_]).
my_member(X, [_|T]):-my_member(X, T).
% Сумма оценок по предмету
% (список оценок, сумма оценок)
sum_grades([],0).
sum_grades([grade(X,Y)|T],N):- sum_grades(T,M), N is Y + M.
% Средний балл для предмета
% (название предмета, средняя оценка)
avg_mark(Sub,Mark):-
    subject(Sub,Y),
    sum_grades(Y, Sum),
    length(Y, Len),
    Mark is Sum / Len.

% 2)Для каждой группы, найти количество не сдавших студентов

% Список всех оценок по всем предметам
% (список предметов, список оценок)
all_marks([],L).
all_marks([H|T], List_pass):-subject(H,X), all_marks(T, New_list), append(X, New_list, List_pass).

% Удаление повторяющихся оценок, чтобы если в списке один и тот же студент получил больше одной 2 по разным предметам, он посчитался лишь один разным
delete_all(_,[],[]).
delete_all(X,[X|L],L1):-delete_all(X,L,L1).
delete_all(X,[Y|L],[Y|L1]):- X \= Y, delete_all(X,L,L1).

remove_same([],[]).
remove_same([H|T],[H|T1]):-delete_all(H,T,T2), remove_same(T2,T1).

% Проверяем, сколько студентов, получивших 2, имеются в нужной группе
% (список всех оценок, список группы, количество несдавших студентов из группы)
check([],L,0).
check([grade(X,Y)|T],L,N):- Y < 3, my_member(X, L), !, check(T,L,M), N is M + 1.
check([_|T],L,N):-check(T,L,N).

% Количество несдавших студентов в группе
% (номер группы, число несдавших)
do_npass_group(Gr,Count):-
    group(Gr, Lgroup),
    findall(Sub, subject(Sub,_), Subs),
    all_marks(Subs, List_pass),
    remove_same(List_pass, New),
    check(New, Lgroup, Count).

% 3)Найти количество несдавших студентов для каждого из предметов
%(список оценок, число несдавших)
count_npass([],0).
count_npass([grade(X,Y)|T],N):- Y < 3, !, count_npass(T,M), N is M + 1.
count_npass([_|T],N):-count_npass(T,N).

% (название предмета, число студентов)
do_npass_subject(Sub,Count):-
    subject(Sub,Y),
    count_npass(Y,Count).