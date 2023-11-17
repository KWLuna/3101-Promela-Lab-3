//channels-1.pml
  mtype = { REQUEST }
  proctype Sender(chan out) {
  byte x;
  do:: x<100 -> out ! REQUEST, x; x++;
    :: x ==100 -> break;
  od
  }

  proctype Receiver(chan in) {
  mtype msg_type;
  int data;
  do::in ? msg_type, data;
      assert(msg_type == REQUEST);
      printf("Received data: %d\n", data);
    ::data == 99 -> break;
  od 
}

init {
  chan ch = [10] of { mtype, int };
  run Sender(ch);
  run Receiver(ch);
}