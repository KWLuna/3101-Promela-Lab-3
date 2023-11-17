//concurrency-3.pml

byte x;
active proctype A(){
x=x+2;
}

active proctype B(){
x=x+2;
}
