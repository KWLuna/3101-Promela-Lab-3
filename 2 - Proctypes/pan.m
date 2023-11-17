#define rand	pan_rand
#define pthread_equal(a,b)	((a)==(b))
#if defined(HAS_CODE) && defined(VERBOSE)
	#ifdef BFS_PAR
		bfs_printf("Pr: %d Tr: %d\n", II, t->forw);
	#else
		cpu_printf("Pr: %d Tr: %d\n", II, t->forw);
	#endif
#endif
	switch (t->forw) {
	default: Uerror("bad forward move");
	case 0:	/* if without executable clauses */
		continue;
	case 1: /* generic 'goto' or 'skip' */
		IfNotBlocked
		_m = 3; goto P999;
	case 2: /* generic 'else' */
		IfNotBlocked
		if (trpt->o_pm&1) continue;
		_m = 3; goto P999;

		 /* PROC :init: */
	case 3: // STATE 1 - proctype-3.pml:20 - [(run B())] (0:0:0 - 1)
		IfNotBlocked
		reached[3][1] = 1;
		if (!(addproc(II, 1, 1)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 4: // STATE 2 - proctype-3.pml:21 - [printf('Hello, I am init and my PID is: %d.\\n',_pid)] (0:0:0 - 1)
		IfNotBlocked
		reached[3][2] = 1;
		Printf("Hello, I am init and my PID is: %d.\n", ((int)((P3 *)_this)->_pid));
		_m = 3; goto P999; /* 0 */
	case 5: // STATE 4 - proctype-3.pml:23 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[3][4] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC C */
	case 6: // STATE 1 - proctype-3.pml:15 - [printf('Hello world, I am B and my PID is %d .\\n',_pid)] (0:0:0 - 1)
		IfNotBlocked
		reached[2][1] = 1;
		Printf("Hello world, I am B and my PID is %d .\n", ((int)((P2 *)_this)->_pid));
		_m = 3; goto P999; /* 0 */
	case 7: // STATE 2 - proctype-3.pml:16 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[2][2] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC B */
	case 8: // STATE 1 - proctype-3.pml:11 - [printf('Hello world, I am B and my PID is %d .\\n',_pid)] (0:0:0 - 1)
		IfNotBlocked
		reached[1][1] = 1;
		Printf("Hello world, I am B and my PID is %d .\n", ((int)((P1 *)_this)->_pid));
		_m = 3; goto P999; /* 0 */
	case 9: // STATE 2 - proctype-3.pml:12 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[1][2] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC A */
	case 10: // STATE 1 - proctype-3.pml:5 - [printf('Hello world, I am A and my PID is %d .\\n',_pid)] (0:0:0 - 1)
		IfNotBlocked
		reached[0][1] = 1;
		Printf("Hello world, I am A and my PID is %d .\n", ((int)((P0 *)_this)->_pid));
		_m = 3; goto P999; /* 0 */
	case 11: // STATE 2 - proctype-3.pml:6 - [(run C())] (0:0:0 - 1)
		IfNotBlocked
		reached[0][2] = 1;
		if (!(addproc(II, 1, 2)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 12: // STATE 4 - proctype-3.pml:8 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[0][4] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */
	case  _T5:	/* np_ */
		if (!((!(trpt->o_pm&4) && !(trpt->tau&128))))
			continue;
		/* else fall through */
	case  _T2:	/* true */
		_m = 3; goto P999;
#undef rand
	}

