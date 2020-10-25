

terrain_types(water;glass;bridge;tree;flower).
construction_types(door;wall;floor;bed).



{construction(XX,YY,TYPE) : construction_types(TYPE)} 1 :- 
width(XX), height(YY).


:- construction(XX,YY,door), construction(XX,YY+1,door).





