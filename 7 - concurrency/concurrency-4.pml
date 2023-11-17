//concurrency-4.pml

int x = 0

active [2] proctype P ()
{ int temp
  do
  ::x<5 -> temp = x; temp ++; x=temp;
  ::x>=5 -> break
   od 	
}
