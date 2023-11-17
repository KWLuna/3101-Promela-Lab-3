//do-3.pml
byte x;
active proctype A(){
	do
	    :: (x>10) -> x = x + 3;
	    :: (x<=10) -> x = x + 2;
	    :: (x<=5) -> x = x + 1;
	od
}