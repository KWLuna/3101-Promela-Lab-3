//conditional-8.pml
  byte x; 
  active proctype A() {
    l: if
        :: x < 5 -> x++;
        :: else -> goto l;
      fi
 }
