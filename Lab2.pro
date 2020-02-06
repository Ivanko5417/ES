include "lab2.inc"

domains
listInt=integer*
listStr=string*

predicates
nondeterm output
nondeterm repeat
nondeterm selectTask (string)
nondeterm task1
nondeterm task2
nondeterm concate (listInt, listInt, listInt)
nondeterm isEmpty (listInt)
nondeterm search (string, string)
nondeterm includes (listStr, string)
nondeterm raspol (string, listStr)
nondeterm postav (string, string, string, integer)


goal
output.

clauses
output:-  repeat, write ("Enter the number of a task please: "), readln(Task), selectTask(Task), Task = "exit".

selectTask (Task):- Task = "1", task1, !.
selectTask (Task):- Task = "2", task2, !.
selectTask (Task):- Task = "exit".

% FIRST TASK
task1:-      write ("Enter the first List please: "), readterm (listInt, List1),
             write ("Enter the second List please:"), readterm (listInt, List2),
            concate (List1, List2, ListRes),
            write (ListRes),
            nl.

concate ([], List2, ListRes) :- ListRes = List2,!.
concate (List1, List2, ListRes) :- List1 = [Head1|T1], isEmpty(T1), ListRes = [Head1|List2],!.
concate (List1, List2, ListRes) :- List1 = [Head1|T1], concate(T1, List2, ListRes1), ListRes = [Head1|ListRes1].

isEmpty ([]).

%SECOND TASJK
task2:-      write ("Country please: "), readln (Country),
             write ("Order please: "), readln (Order),
             search (Country, Order), nl.
search (Country1, Order):- raspol(Country1, FactoriesList),
                  postav (Factory1, Factory2, Order, Price),
                  includes(FactoriesList, Factory1),
                  not(includes(FactoriesList, Factory2)),
                  write (Factory1,"  ",Factory2, " ", Price),nl, fail.
search(_,_).

includes(StrList, Item) :- StrList = [Item|_], !.
includes(StrList, Item) :- StrList = [_| T], includes(T, Item).

% REPEAT
repeat.
repeat:- repeat.

%FACTS
raspol("Russia", ["Audi", "Integral"]).
raspol("Poland",["BMW"]).
raspol("Belarus",["Lada"]).
raspol("USA",["IBM","Apple"]).

postav("BMW","Integral","transformer",200).
postav("Integral","Audi","microshema",500).
postav("Audi","BMW","Broken cars",350000).
postav("Integral","Lada","Broken cars",2).
postav("Audi", "Lada", "transformer", 1).

