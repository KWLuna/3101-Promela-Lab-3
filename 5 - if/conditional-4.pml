//conditional-4.pml
  byte x; 
  active proctype A() {
   if
     :: x ==1 -> x++;
     :: else -> skip;
   fi
 }
