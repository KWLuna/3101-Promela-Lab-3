byte x;

byte x;

active proctype A(){
  do::x<5 -> x=x+1;
    ::else -> break;
  od;
}

active proctype monitor(){
  do:: assert(x<=5);
  od
}  