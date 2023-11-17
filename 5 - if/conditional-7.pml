//conditional-7.pml
byte x; 
active proctype A() {
  l: x++;
  goto l;
}
