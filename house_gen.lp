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
:- {construction(XX,YY,door)} 1.





