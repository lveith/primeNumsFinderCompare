//%attributes = {}
// PM: "startFormPrimesFinderCompare"

C_TEXT:C284($calledBy; $1)
C_LONGINT:C283($winRef)
C_LONGINT:C283($processId)

If (Count parameters:C259>0)
	$calledBy:=$1
Else 
	$calledBy:=""
End if 

If ($calledBy#Current method name:C684)  // isSelfLauched
	// Start the process (if it does not exist) or bring it to the front (if it is already running)
	$processId:=New process:C317(Current method name:C684; 0; "primesFinderCompareDialog"; Current method name:C684; *)
	If ($processId#0)
		SHOW PROCESS:C325($processId)
		BRING TO FRONT:C326($processId)
	End if 
	
Else 
	$winRef:=Open form window:C675("primesFinderCompare")
	DIALOG:C40("primesFinderCompare")
	CLOSE WINDOW:C154($winRef)
	
End if 

// - EOF -
