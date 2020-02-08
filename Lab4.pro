include "lab4.inc"

predicates
nondeterm output
nondeterm value(integer)


goal
output.

clauses
output:- value(A), value (C), value(D), B = 0,
	A + B + C + D >= 1,
	A - C >= 1,
	D  - A >= 0,
	D - C * ( 1 - B) >= 0,
           write ("A=", A, "  B=", B, "  C=", C, "  D=", D), nl, fail, !.
output.       

value(X):- X=0.
value(X):- X=1.
