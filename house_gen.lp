#const max_width=12.
#const max_height=10.
construction_type(door;wall;floor;bed).

width(1..max_width).
height(1..max_height).

1 {construction(XX,YY,CONSTRUCTION_TYPE) : construction_type(CONSTRUCTION_TYPE)} 1 :- 
	width(XX), 
	height(YY).

neighbors(XX,YY,TYPE, COUNT) :- 
	COUNT =  {construction(XX-1,YY-1,TYPE);
					construction(XX,YY-1,TYPE);
					construction(XX+1,YY-1,TYPE);
					construction(XX-1,YY,TYPE);
					construction(XX+1,YY,TYPE);
					construction(XX-1,YY+1,TYPE);	
					construction(XX,YY+1,TYPE);
					construction(XX+1,YY+1,TYPE)},
					construction(XX,YY,_),					
					construction(TYPE).
					
					
	
immediate_neighbors(XX,YY,TYPE, COUNT) :- 
	COUNT =  {construction(XX,YY-1,TYPE);
					construction(XX-1,YY,TYPE);
					construction(XX+1,YY,TYPE);
					construction(XX,YY+1,TYPE)},
					construction(XX,YY,_),					
					construction(TYPE).
:- {construction(XX,YY,door)} 1 .

on_water_bridge_tree(XX,YY) :-  construction(XX,YY,water).
on_water_bridge_tree(XX,YY) :-  construction(XX,YY,bridge).
on_water_bridge_tree(XX,YY) :-  construction(XX,YY,tree).

:- construction(XX,YY,door), not on_water_bridge_tree(XX,YY).
:- construction(XX,YY,wall), not on_water_bridge_tree(XX,YY).
:- construction(XX,YY,floor), not on_water_bridge_tree(XX,YY).
:- construction(XX,YY,bed), not on_water_bridge_tree(XX,YY).

open_water_bridge_tree(XX,YY) :-  construction(XX+1,YY,water), construction(XX-1,YY,water).
open_water_bridge_tree(XX,YY) :-  construction(XX,YY-1,water), construction(XX,YY+1,water).
open_water_bridge_tree(XX,YY) :-  construction(XX+1,YY,bridge), construction(XX-1,YY,bridge).
open_water_bridge_tree(XX,YY) :-  construction(XX,YY-1,bridge), construction(XX,YY+1,bridge).
open_water_bridge_tree(XX,YY) :-  construction(XX+1,YY,tree), construction(XX+1,YY,tree).
open_water_bridge_tree(XX,YY) :-  construction(XX,YY-1,tree), construction(XX,YY+1,tree).

:- construction(XX,YY,door), not open_water_bridge_tree(XX,YY).

sidebyside(XX,YY) :-   construction(XX,YY-1,door).
sidebyside(XX,YY) :-   construction(XX,YY+1,door).
sidebyside(XX,YY) :-   construction(XX-1,YY,door).
sidebyside(XX,YY) :-   construction(XX+1,YY,door).

:- construction(XX,YY,door), not sidebyside(XX,YY).

corner(XX,YY) :- XX=0.
corner(XX,YY) :- XX=max_height.
corner(XX,YY) :- YY=0.
corner(XX,YY) :- YY=max_width.

:- construction(XX,YY,door), not corner(XX,YY).
