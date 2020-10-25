#const max_width=12.
#const max_height=10.


construction_type(door;wall;floor;bed).

width(1..max_width).
height(1..max_height).

1 {construction(XX,YY,CONSTRUCTION_TYPE) : construction_type(CONSTRUCTION_TYPE)} 1 :- 
	width(XX), 
	height(YY).


:- {construction(XX,YY,door)} 1.





