mtype = { START, TASK, DONE };

chan rendezvousCh = [0] of { mtype }; // Rendezvous channel
chan taskCh = [10] of { mtype, int }; // Asynchronous channel for tasks

/* Control process that coordinates the start of work and sends tasks */
proctype ControlProcess(chan sync; chan tasks) {
  // Synchronize with the worker
  sync ! START;
  printf("ControlProcess: Sent START signal\n");

  // Send tasks
  int i;
  int j;
  do ::i<5 ->
    tasks ! TASK, i;
    printf("ControlProcess: Sent TASK %d\n", i);
    i = i + 1;
    :: tasks ? DONE, j -> 
      assert( j <= 4);
      printf("ControlProcess: Received DONE TASK %d\n");
    ::j = 4 ->  break
  od

  // Signal that all tasks are done
  printf("ControlProcess: Sent DONE signal\n");
}

proctype TaskProcess(chan tasks; int task_id) {
  printf("Task %d Done\n",task_id);
  tasks ! DONE, task_id;
}

/* Worker process that waits for synchronization and processes tasks */
proctype WorkerProcess(chan sync; chan tasks) {
  mtype msgType;
  int data;

  // Wait for the go-ahead to start working
  sync ? START;
  printf("WorkerProcess: Received START signal\n");

  do
  :: tasks ? TASK, data ->
     printf("WorkerProcess: Processing TASK %d\n", data);
     run TaskProcess(tasks, data);
  :: data = 4 -> printf("All Task Released\n"); break;
  od
}


active proctype monitor(){
int x;
atomic{end:do::taskCh??<_,x> ->
           if::x<=4 -> skip;
             ::else -> printf("value %d\n",x);assert(x<=4);
           fi
       od 
      };
}

/* Main process */
init {
  run ControlProcess(rendezvousCh, taskCh);

  run WorkerProcess(rendezvousCh, taskCh);
}
