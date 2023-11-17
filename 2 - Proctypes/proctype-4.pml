active [2] proctype A(byte b) {
  atomic{ run C(_pid);
           printf("Hello world, I am A and my PID is %d .\n",_pid);
  }
}

proctype B(pid b) {
  printf("Hello world, I am B and my PID is %d and my parent PID is %d.\n",_pid, b);
}

proctype C(byte b){
  printf("Hello world, I am C and my PID is %d and my parent PID is %d.\n",_pid, b);
}
init {
  atomic{ run B(_pid);
          printf("Hello, I am init and my PID is: %d.\n",_pid);
  }
}
