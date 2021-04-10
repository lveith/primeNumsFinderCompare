//%attributes = {"preemptive":"capable"}
// PM: warmUpWorker
// $1 - C_LONGINT - Limit of max to exec
// Neutralizer, warmup workerExecAllFuncs

C_LONGINT:C283($maxLimit; $1)
C_BLOB:C604($blob)
C_TIME:C306($docRef)

If (Count parameters:C259>0)
	$maxLimit:=$1
End if 

ARRAY BOOLEAN:C223($arIsNotPrime; 0)
ARRAY BOOLEAN:C223($arIsNotPrime; $maxLimit)

SET BLOB SIZE:C606($blob; 0)
VARIABLE TO BLOB:C532($arIsNotPrime; $blob)
COMPRESS BLOB:C534($blob; Fast compression mode:K22:13)

$docRef:=Create document:C266("warmUpWorker.dta")  // Save the document of your choice
If (OK=1)  // If a document has been created
	CLOSE DOCUMENT:C267($docRef)  // We don't need to keep it open
	BLOB TO DOCUMENT:C526(Document; $blob)  // Write the document contents
	If (OK=0)
		// Handle error
		BEEP:C151
		TRACE:C157
	End if 
End if 

// - EOF -