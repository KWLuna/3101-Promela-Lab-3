byte x;

active proctype A(){
  do::x<5 -> x=x+1;
    ::else -> break;
  od;
}

active proctype monitor(){
 end:atomic{x>5 -> assert(x<=5)}
}
