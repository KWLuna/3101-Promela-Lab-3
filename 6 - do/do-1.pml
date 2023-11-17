//do-1.pml
  byte x; 
  active proctype A() {
   do
     :: x == 0 -> x++;
     :: x == 1 -> x--;
   od
