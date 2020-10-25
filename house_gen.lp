#const max_width=12.
#const max_height=10.

terrain_types(water;glass;bridge;tree;flower).
construction_types(door;wall;floor;bed).

width(1..max_width).
height(1..max_height).

{construction(XX,YY,TYPE) : construction_types(TYPE)} 1 :- 
	width(XX), 
	height(YY).


:- construction(XX,YY,door), construction(XX,YY+1,door).





