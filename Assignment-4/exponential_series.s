
     AREA     appcode, CODE, READONLY
     EXPORT __main
	 ENTRY 
__main  FUNCTION		 		
			  VMOV.F32 S0, #-2.0  ;exponent for e
			  VMOV.F32 S7, #1          
			  VMOV.F32 S9, #26	     ;Number of terms in the series
			  VMOV.F32 S1, #1.0  ;temporary register
			  VMOV.F32 S2, #1.0  ;SUM of the exponential series
			  VMOV.F32 S8, #1.0
			  
LOOP	VCMP.F32 S7, S9
		VMRS.F32 APSR_nzcv, FPSCR  ; to copy flag values fpsr to apsr 
		BEQ STOP
		VDIV.F32 S3, S0, S7
		VMUL.F32 S1, S1, S3       ;temp = temp *(number)/1
		VADD.F32 S2, S2, S1		  ; sum = sum+temp
		VADD.F32 S7, S7, S8       ; incrementing 
		B LOOP
			  
			  
				
STOP		      B STOP  ; stop program

     ENDFUNC
     END

/* Logic  temp= temp * (number/i)
		  sum = sum + temp
		  */