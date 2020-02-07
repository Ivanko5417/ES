include "lab3.inc"

global domains
education=v (string, string, integer);
          s (string, string, integer);
          k (string, integer)
global facts
rabotnik(string,integer,string,education)
zarp(string,string,integer)


predicates
nondeterm start
nondeterm repeat
nondeterm menu (string)
nondeterm load
nondeterm show
nondeterm addNew
nondeterm saveDB

goal
start.


clauses
start:-  repeat,
         write ("Menu:"), nl,
         write ("1 - Load DB"), nl,
         write ("2 - Show employees"), nl,
         write ("3 - Add a new employee"), nl,
         write ("4 - Save"), nl,
         write ("Exit"), nl,
         write ("Please make your choice: "), readln (Choice),
         nl, nl,
         menu (Choice).
         
menu ("1"):- load.
menu ("2"):- show. 
menu ("3"):- addNew.
menu ("4"):- saveDB.
menu ("exit").


% 1
load:-retractall(_), consult("C:\\Users\\vdrob\\Documents\\Labs\\Lab3.dba"),
write("DB was successfully loaded!"), nl, nl, fail.

%2

show:-
	rabotnik(Name, Year, Job, Education),
	zarp(Job, JobName, Salary),
	write(Name, "  ", Year, "  ", JobName, "  ", Education, "  ", Salary),
	nl, fail.
show:- nl, nl, fail.

%3

addNew:- 
	write("Enter name please: "), readln(Name),
	write("Enter year please: "), readint(Year),
	write("Enter job code please: "), readln(Job),
	write("Enter education please: "), readterm(education, Education),
	assert(rabotnik(Name, Year, Job, Education)),
	nl, nl, fail.
	
%4

saveDB:- save("C:\\Users\\vdrob\\Documents\\Labs\\Lab3.dba"), fail.
	
%REPEAT
repeat.
repeat:- repeat.


