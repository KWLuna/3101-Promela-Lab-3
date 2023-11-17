
mtype = {msg};

/* a channel with buffer for 10 messages */
chan c = [10] of {mtype, int};
int sent, received, processed;

int isqr;

/* LTL formulae to specify various properties about the global variables */

/* Valid range of variables sent, received and processed (in all states) */
ltl p1 {[] (0 <= sent && sent <= 100 &&
            0 <= received && received <= sent &&
            0 <= processed && processed <= received/2)}

/* Since isqr is the square of an even "i", it must be a multiple of 4
   (in all states) */
ltl p2 {[] (isqr%4 == 0)}

/* In any state with (processed >= 10), (isqr >= 400) must hold */
ltl p3 {[] ((processed >= 10) -> (isqr >= 400))}

/* Some state must be reached with (isqr == 900) ("i" becomes 30) */
ltl p4 {<> (isqr == 900)}

/* Some state must be reached with (isqr == 64), and till then (sent < 20)
   must hold */
ltl p5 {(sent < 20) U (isqr == 64)}

/* After a state with (sent >= 50), some state must be reached with
   (processed >= 25) */
ltl p6 {[] ((sent >= 50) -> <>(processed >= 25))}

/* After a state with (sent == 100), some state must be reached with
   (received == 100) and (processed == 50) */
ltl p7 {[] ((sent == 100) -> <>(received == 100 && processed == 50))}


active proctype sender()
{
  
  do
    :: sent < 100 ->
        atomic {c!msg(sent+1); sent++;}

    :: else       ->
        break;
  od
}

active proctype receiver()
{
  int i;

  
  do
    :: received < 100 ->
        c?msg(i);

        
        assert(i >= 1 && i <= 100);

        received++;

        if
          :: i%2 == 0 -> isqr = i*i; processed++;
          :: else
        fi

    :: else ->
        break;
  od
}