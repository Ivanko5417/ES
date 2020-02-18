include "lab6.inc"

global domains
	uslovie=gt(string,string);
	lt(string,string);
	eq(string,string)
	usl=uslovie*
	zakl=assign(string,string)
global facts
	rule(integer,usl,zakl)
	log1(string,integer)
	var(string,string)
	goal_var(string)	
	znach(string,string)
predicates
	nondeterm load
	nondeterm show
	nondeterm output
	nondeterm how
	nondeterm reverseOutput (string, string)
	nondeterm check(usl)
	nondeterm checkUslovie(uslovie)
	nondeterm start
	nondeterm repeat
	nondeterm menu (string)
	nondeterm showInfo (string)
goal
start.


clauses
start:-  repeat,
         write ("Menu:"), nl,
         write ("1 - Load DB"), nl,
         write ("2 - Show rules list"), nl,
         write ("3 - Consulting"), nl,
         write ("4 - How?"), nl,
         write ("Exit"), nl,
         write ("Please make your choice: "), readln (Choice),
         nl, nl,
         menu (Choice).
	
menu("1"):- load, !,fail.
menu("2"):- show, !,fail.
menu("3"):- output, !,fail.
menu("4"):- how, !,fail.
menu("exit").


%LOAD
load:-retractall(_),consult("C:\\Users\\vdrob\\Documents\\Labs\\Lab6.dba"),write("DB was successfully loaded!"), nl, nl,!.
load.

%SHOW
show:-var(X,_), write("Variable: ",X),nl, fail.
show:-rule(N,Rule,Zakl),write("¹: ",N," If: ",Rule," then: ",Zakl),nl,fail.
show.



output:-
	retractall (znach(_,_)),
	goal_var (G),
	reverseOutput (G,Result),
	nl, write ("Result: ", Result),
	nl, !.
output:- nl, write ("Nothing found:("), nl, fail.

reverseOutput (G,Result):- znach (G,Result), !.
reverseOutput (G,Result):-
   var (G,Zapros), Zapros <> "",
   write (Zapros), readln (Result), 
   assert (znach(G,Result)), !. 
reverseOutput(G,Result):-
   rule (N,Usl, assign(G,Result)),
   check (Usl),
   assert(log1(G,N)),
   assert (znach(G,Result)), !.
   
check([]):- !.
check(Usl):- Usl=[H|T],
	checkUslovie(H),
	check (T).

checkUslovie(Uslovie):- Uslovie=eq(Perem,Vel), !,
	reverseOutput(Perem,X),
	X=Vel.
checkUslovie(Uslovie):- Uslovie=gt(Perem,Vel), !,
	reverseOutput(Perem,X),
	str_real(Vel, VelNumber),
	str_real(X, XNumber),
	XNumber>VelNumber.
checkUslovie(Uslovie):- Uslovie=lt(Perem,Vel), !,
	reverseOutput(Perem,X),
	str_real(Vel, VelNumber),
	str_real(X, XNumber),
	XNumber<VelNumber.


how:-var(X,_), znach (X,Result), write("Variable: ",X, " = ", Result),nl, fail.
how:- repeat, write("Choose varialbe please: "), readln(Var), nl, showInfo(Var), Var = "exit".
how.
	 
showInfo(Var):- var (Var,Zapros), Zapros <> "", write("Variable was entered by YOU!"), nl.
showInfo(Var):- log1(Var, N), rule(N, Usl, _), write("Variable was initialized because of rule [", N, "] ", Usl), nl.
showInfo(_).

%REPEAT
repeat.
repeat:-repeat.	  


repeat:-repeat.	  
