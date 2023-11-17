 //do-2.pml
  byte x; 
  active proctype A() {
   do
     :: x < 1 -> x++;
     :: x == 1 -> x--; break;
   od
   printf("I am process %d and I have exited the loop.\n", _pid);
 }
