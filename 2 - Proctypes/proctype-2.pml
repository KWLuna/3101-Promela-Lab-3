/* Process declarations and spawning*/

active [2] proctype A() {
	  printf("Hello world, I am A and my PID is %d .\n",_pid);
  	run C();
}

proctype B() {
  printf("Hello world, I am B and my PID is %d .\n",_pid);
}

proctype C() {
  printf("Hello world, I am C and my PID is %d .\n",_pid);
}

init {
     run B();
     printf("Hello, I am init and my PID is: %d.\n",_pid);
}
