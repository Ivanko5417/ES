include "lab5.inc"

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
	nondeterm vyvod
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
menu("3"):- vyvod, !,fail.
menu("exit").


%LOAD
load:-retractall(_),consult("C:\\Users\\vdrob\\Documents\\Labs\\Lab5.dba"),write("DB was successfully loaded!"), nl, nl,!.
load.

%SHOW
show:-var(X,_), write("Variable: ",X),nl, fail.
show:-rule(N,Rule,Zakl),write("¹: ",N," If: ",Rule," then: ",Zakl),nl,readchar(_),fail.
show.


%TODO
vyvod.
	 
 
%REPEAT
repeat.
repeat:-repeat.	  


repeat:-repeat.	  




