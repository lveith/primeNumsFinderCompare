// OM: "primesFinderCompare".oBtnKillWorker
// Button "Kill worker"

Case of 
	: (Form event code:C388=On Clicked:K2:4)
		KILL WORKER:C1390("workerExecAllFuncs")
		// setInfoInProgress(False)
		
End case 

// - EOF -