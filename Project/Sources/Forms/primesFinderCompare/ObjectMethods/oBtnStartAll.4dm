// OM: "primesFinderCompare".oBtnStartAll
// Button "Start ALL"

C_LONGINT:C283($maxLimit)
C_OBJECT:C1216($obj)

Case of 
	: (Form event code:C388=On Clicked:K2:4)
		setInfoInProgress(True:C214)
		
		Case of 
			: (Form:C1466.maxLimit1M)
				$maxLimit:=Form:C1466.max1M
				
			: (Form:C1466.maxLimit100M)
				$maxLimit:=Form:C1466.max100M
				
			: (Form:C1466.maxLimitAll)
				$maxLimit:=Form:C1466.max2B
				
			Else 
				$maxLimit:=Form:C1466.max1M
				
		End case 
		
		For each ($obj; Form:C1466.primesTestResults)
			If ($obj#Null:C1517)
				// Init start values in obj.props
				Use (Form:C1466.primesTestResults)
					$obj.ms:=(-1)
					$obj.msAlloc:=(-1)
					$obj.msSum:=(-1)
					$obj.found:=(-1)
					$obj.ok:=False:C215
					$obj.test:=(-1)
				End use 
			End if 
		End for each 
		
		refreshListbox
		
		// Neutralizer, warmup workerExecAllFuncs
		CALL WORKER:C1389("workerExecAllFuncs"; "warmUpWorker"; $maxLimit)
		
		// Exec all up to max limit
		CALL WORKER:C1389("workerExecAllFuncs"; "execAllFuncs"; Form:C1466.primesTestResults; $maxLimit; Current form window:C827)
		
End case 

// - EOF -