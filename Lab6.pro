include "lab6.inc"

global domains
	uslovie=gt(string,string);
	lt(string,string);
	eq(string,string)
	usl=uslovie*
	zakl=assign(string,string)
global facts
	rule(integer,usl,zakl)
	var(string,string)
	goal_var(string)	
	znach(string,string)
predicates
	nondeterm load
	nondeterm show
	nondeterm output
	nondeterm reverseOutput (string, string)
	nondeterm check(usl)
	nondeterm checkUslovie(uslovie)
	nondeterm start
	nondeterm repeat
	nondeterm menu (string)
goal
start.


clauses
start:-  repeat,
         write ("Menu:"), nl,
         write ("1 - Load DB"), nl,
         write ("2 - Show rules list"), nl,
         write ("3 - Consulting"), nl,
         write ("Exit"), nl,
         write ("Please make your choice: "), readln (Choice),
         nl, nl,
         menu (Choice).
	
menu("1"):- load, !,fail.
menu("2"):- show, !,fail.
menu("3"):- output, !,fail.
menu("exit").


%LOAD
load:-retractall(_),consult("C:\\Users\\vdrob\\Documents\\Labs\\Lab6.dba"),write("DB was successfully loaded!"), nl, nl,!.
load.

%SHOW
show:-var(X,_), znach (X,Result), write("Variable: ",X, " = ", Result),nl, fail.
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

reverseOutput (G,Result):- write("Looking for: ", G), nl, znach (G,Result), write("Found value of ", G, " = ", Result), readchar(_), nl, !.
reverseOutput (G,Result):-
   var (G,Zapros), Zapros <> "",
   write (Zapros), readln (Result), 
   assert (znach(G,Result)), !. 
reverseOutput(G,Result):-
   rule (N,Usl, assign(G,Result)),
   write("[", N, "]Usl to check: ", Usl), nl,
   readchar(_),
   check (Usl),
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



	 
 
%REPEAT
repeat.
repeat:-repeat.	  


repeat:-repeat.	  
