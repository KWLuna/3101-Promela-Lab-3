//conditional-2.pml
  byte x; 
  active proctype A() {
   if
     :: x == 0 -> x++;
     :: x <= 1 -> x--;
   fi
