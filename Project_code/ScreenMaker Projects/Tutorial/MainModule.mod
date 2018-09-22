MODULE MainModule
	PERS num partsReady := 16;
	PERS num cycleTime := 5.01645;
	PERS num job := 0;
	CONST num JobIdle := 0;
	CONST num JobProduce := 1;
	CONST num JobBulls := 2;
	CONST num JobService := 3;
	VAR intnum intJob;
	
	PROC main()
	  IDelete intJob;	
	 	CONNECT intJob WITH ScheduleJob;
		ISignalGO GO_JOB, intJob;
		
 	  ! set initial states
 	  ResetAll;
	
	    WHILE TRUE DO
	    	IF job = JobProduce THEN
	    		RunProduce;
	    	ELSEIF job = JobBulls THEN
	    	    job := JobIdle;
	    		RunBulls;	    		
	    	ELSEIF job = JobService THEN
	    	    job := JobIdle;
	    		RunService;
	    	ELSE
	    		
	    	ENDIF
	    ENDWHILE    
	    
	    ! finish up
	    IDelete intJob;
	ENDPROC
	
	PROC ResetAll()
		SetDO DO_SIMHOME, 1;
		SetDO DO_SIMSERVICE, 0;
		SetDO DO_SIMBULLS, 0;
		SetDO DO_PRODUCE, 0;
		job := JobIdle;
	ENDPROC
	
	PROC RunProduce()
	    ! go to part location
		SetDO DO_SIMHOME, 0;
		SetDO DO_PRODUCE,1;

        ! continously handle part
	    WHILE job = JobProduce DO
 			! produce part
			waitTime 3;		
			cycleTime := (cycleTime*partsReady+5.0+2*sin(partsReady/100*2*3.142))/(partsReady+1);
			partsReady := partsReady + 1;	
		ENDWHILE	
		
		! leave part location
		SetDO DO_PRODUCE, 0;
		! home run
		RunHomeRun;	
	ENDPROC
	
	PROC RunService()    
	    ! go to service location 
	    SetDO DO_SIMHOME, 0;		
	    ! run service routine
		SetDO DO_SIMSERVICE, 1;
		WaitTime 3;
		! Finish teh job
		SetDO DO_SIMSERVICE, 0;
		! home run
		RunHomeRun;
	ENDPROC
	PROC RunBulls()
	    ! go to calib location 
	    SetDO DO_SIMHOME, 0;		
		! run bullseye routine
		SetDO DO_SIMBULLS, 1;
		waitTime 3;
		! Finish the job
		SetDO DO_SIMBULLS, 0;
		! home run
		RunHomeRun;
	ENDPROC
	PROC RunHomeRun()
		! go back to home
		SetDO DO_SIMHOME, 1;			
	ENDPROC
	
	TRAP ScheduleJob
		job:=GOutput(GO_JOB);
	ENDTRAP
ENDMODULE