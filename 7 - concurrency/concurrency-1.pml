//concurrency-1.pml

byte x;
active proctype A(){
x++;
x++;
}

active proctype B(){
x++;
x++;
}
