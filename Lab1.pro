include "Lab1.inc"

predicates
nondeterm output
nondeterm raspol (string, string)
nondeterm postav (string, string, string, integer)
nondeterm search1 (string, string)
nondeterm search2 (string, string)
nondeterm repeat
nondeterm selectTask (string)
nondeterm task1
nondeterm task2

goal
output.

clauses
output:-  repeat, write ("Enter the number of a task please: "), readln(Task), selectTask(Task), Task = "exit".

selectTask (Task):- Task = "1", task1, !.
selectTask (Task):- Task = "2", task2, !.
selectTask (Task):- Task = "exit".

% FIRST TASK
task1:-      repeat, write ("Country please: "), readln (Country),
             write ("Order please: "), readln (Order),
             search1 (Country, Order), nl, write ("Continue? "), readln(Continue), Continue="no".
search1 (Country1, Order):- raspol(Factory1, Country1),
                  postav (Factory1, Factory2, Order, Price),
                  raspol(Factory2, Country2),
                  Country2 <> Country1,
                  write (Factory1,"  ",Factory2, " ", Price),nl, fail.
search1(_,_).


% SECOND TASK
task2:-  repeat,
             write ("The first country: "), readln (Country1),
             write ("The second country: "), readln (Country2),
             search2 (Country1, Country2), nl, write ("Continue? "), readln(Continue), Continue="no".
search2 (Country1, Country2):- 
                  Country2 <> Country1,
		  raspol(Factory1, Country1),
		  raspol(Factory2, Country2),
                  postav (Factory1, Factory2, Order, Price),
                  write (Factory1,"  ",Factory2, " ", Order, " ", Price),nl.

search2(_,_) :- write("No!").


% REPEAT
repeat.
repeat:-repeat.
 

raspol("Audi","Russia").
raspol("BMW","Poland").
raspol("Integral","Russia").
raspol("Lada","Belarus").

postav("BMW","Integral","transformer",200).
postav("Integral","Audi","microshema",500).
postav("Audi","BMW","Broken cars",350000).
postav("Integral","Lada","Broken cars",2).
postav("Audi", "Lada", "transformer", 1).

