//conditional-3.pml
  byte x; 
  active proctype A() {
   if
     :: x ==1 -> x++;
     :: x ==2 -> x--;
     :: else -> x = 1;
   fi
}
