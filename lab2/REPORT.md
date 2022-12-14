## Отчет по лабораторной работе №2
## по курсу "Логическое программирование"

## Решение логических задач

### студент: Чубуков А. В.

## Результат проверки

| Преподаватель     | Дата         |  Оценка       |
|-------------------|--------------|---------------|
| Сошников Д.В. |              |               |
| Левинская М.А.|              |               |



## Введение

"Решить задачу" на языке логике означает найти истинное высказывание, которое отвечает на вопрос задачи. Способов к решению таких задач довольно много, например, метод рассуждений, метод таблиц или метод алгебры логики.

Метод рассуждений применяется на практике только для простых и детских задач. Его идея состоит в том, чтобы методами рассуждений и общих человеческих знаний, проводится логическая цепочка от одной идеи к другой, последовательно используя все условия задачи. Гораздо больше с серьезными логическими задачами работает метод таблиц. В таблице можно наглядно пронаблюдать условия задачи и вывести ее ответ методом рассуждений с некоторым упрощением. Наиболее часто для сложных логических задач используют средства алгебры логики. Для решения данным методом, следует переписать исходные выражения и высказывания в виде какого-либо набора выражений алгебры логики и вывести из данного выражения ответ.

Помимо основных методов, существуют и другие, менее используемые методы.
Например, графический, блок-схем и другие.

Prolog является удобным инструментом для решения логических задач, поскольку является декларативным языком программирования, из чего следует, что на нем можно задать объекты, условия и связи между ними, а затем, используя средства логического языка программирования, просто "попросить" решить задачу, исходя из заданных предикатов.

## Задание

Тренер команды пятиборцев решил устроить для своих воспитанников отборочные соревнования. В программу состязаний он включил все пять видов спорта: плавание, кросс, фехтование, стрельбу и верховую езду. В итоге соревнований по сумме набранных баллов на первое место вышел Ачкасов, затем шли Боровский, Колоколов, Дикушин и на последнем месте оказался Емельянов. Система оценки результатов была такая: занявший первое место в состязании по тому или другому виду спорта получал 5 баллов, следующий за ним 4 балла и т.д. Ачкасов закончил соревнования, набрав 24 балла. Колоколов получил по четырем видам спорта одинаковые баллы. Емельянов завоевал первенство в соревнованиях по стрельбе, а по верховой езде вышел на третье место. Какое место на соревнованиях по стрельбе занял Боровский? 

## Принцип решения

Прежде всего, стоит перебрать все варианты распределения очков по людям:

```prolog
permutation([5,4,3,2,1],[PA,PB,PK,PD,PE]),
permutation([5,4,3,2,1],[CA,CB,CK,CD,CE]),
permutation([5,4,3,2,1],[FA,FB,FK,FD,FE]),
permutation([5,4,3,2,1],[SA,SB,SK,SD,SE]),
permutation([5,4,3,2,1],[VA,VB,VK,VD,VE]),
```
> P - первый вид спорта, C - второй, и т.д....
> A,B и т.д - первые буквы фамилий участников

Затем, стоит указать, что у Колоколова есть 4 одинаковых числа, но мы не знаем какие именно:
```prolog
permutation([_,B,B,B,B],[PK,CK,FK,SK,VK]),
```
Затем сделаем проверку на места в отдельных видах спорта Емельянова:
```prolog
SE =:= 6 - 1,
VE =:= 6 - 3,
```
И удостоверимся, что сумма очков Ачкасова равнялась 24:
```prolog
ScA is PA + CA + FA + SA + VA,
ScA = 24,
```

Затем идут проверки на места(у 1 меньше очков, чем у 2 и т.д.):
```prolog
PB+CB+FB+SB+VB<PA+CA+FA+SA+VA,
PK+CK+FK+SK+VK<PB+CB+FB+SB+VB,
PD+CD+FD+SD+VD<PK+CK+FK+SK+VK,
PE+CE+FE+SE+VE<PD+CD+FD+SD+VD,
```

ответ:
```prolog
!,
X is 6- SB.
```

Т.к. в данной программе просиходит полный перебор, ее сложность будет `O(n!)`

Полный предикат:
```prolog
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
```

Ответ(Боровский занял 5-е место):
```prolog
?- mestoBorovskogo(X).
X = 5.
```


## Выводы

Благодаря данной лабораторной работе я научился решать логические задачи с помощью логически-декларативного языка Prolog и смог реализовать вывод решения, основываясь на условиях данной задачи. Также ознакомился с различными методами решения логических задач и их сложностями.

Результатом работы программы является непротиворечивое единственно верное решение, при котором соблюдены все условия задачи.

Prolog является удобным и мощным инструментом для решения сложных логических задач. В Prolog встроена функция выводимости высказываний, что означает, что, используя данный язык, можно даже составить новую теорему или лемму, основываясь лишь на тех данных, что у человека уже имеется. С практической же точки зрения Prolog является удобным инструментом лишь для сложных и/или трудоемких логических задач. Для других - менее затратных - следует использовать другие более простые методы.


