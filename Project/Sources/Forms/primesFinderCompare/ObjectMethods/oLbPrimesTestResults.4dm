// Method: primesFinderCompare.oLbPrimesTestResults

Case of 
	: (Form event code:C388=On Header Click:K2:40)
		Case of 
			: (FORM Event:C1606.columnName="oColFunction")
				If (Form:C1466.sortOrderCol1=ck ascending:K85:9)
					Use (Form:C1466.primesTestResults)
						Form:C1466.primesTestResults:=Form:C1466.primesTestResults.orderBy("function desc, max asc")
					End use 
					Form:C1466.sortOrderCol1:=ck descending:K85:8
					$0:=ck descending:K85:8
				Else 
					Use (Form:C1466.primesTestResults)
						Form:C1466.primesTestResults:=Form:C1466.primesTestResults.orderBy("function asc, max asc")
					End use 
					Form:C1466.sortOrderCol1:=ck ascending:K85:9
					$0:=ck ascending:K85:9
				End if 
				
			: (FORM Event:C1606.columnName="oColMax")
				If (Form:C1466.sortOrderCol2=ck ascending:K85:9)
					Use (Form:C1466.primesTestResults)
						Form:C1466.primesTestResults:=Form:C1466.primesTestResults.orderBy("max desc, function asc")
					End use 
					Form:C1466.sortOrderCol2:=ck descending:K85:8
					$0:=ck descending:K85:8
				Else 
					Use (Form:C1466.primesTestResults)
						Form:C1466.primesTestResults:=Form:C1466.primesTestResults.orderBy("max asc, function asc")
					End use 
					Form:C1466.sortOrderCol2:=ck ascending:K85:9
					$0:=ck ascending:K85:9
				End if 
				
			: (FORM Event:C1606.columnName="oColMsAlloc")
				If (Form:C1466.sortOrderCol3=ck ascending:K85:9)
					Use (Form:C1466.primesTestResults)
						Form:C1466.primesTestResults:=Form:C1466.primesTestResults.orderBy("max desc, msAlloc desc, function asc")
					End use 
					Form:C1466.sortOrderCol3:=ck descending:K85:8
					$0:=ck descending:K85:8
				Else 
					Use (Form:C1466.primesTestResults)
						Form:C1466.primesTestResults:=Form:C1466.primesTestResults.orderBy("max desc, msAlloc asc, function asc")
					End use 
					Form:C1466.sortOrderCol3:=ck ascending:K85:9
					$0:=ck ascending:K85:9
				End if 
				
			: (FORM Event:C1606.columnName="oColMsMain")
				If (Form:C1466.sortOrderCol4=ck ascending:K85:9)
					Use (Form:C1466.primesTestResults)
						Form:C1466.primesTestResults:=Form:C1466.primesTestResults.orderBy("max desc, ms desc, function asc")
					End use 
					Form:C1466.sortOrderCol4:=ck descending:K85:8
					$0:=ck descending:K85:8
				Else 
					Use (Form:C1466.primesTestResults)
						Form:C1466.primesTestResults:=Form:C1466.primesTestResults.orderBy("max desc, ms asc, function asc")
					End use 
					Form:C1466.sortOrderCol4:=ck ascending:K85:9
					$0:=ck ascending:K85:9
				End if 
				
			: (FORM Event:C1606.columnName="oColMsSummary")
				If (Form:C1466.sortOrderCol5=ck ascending:K85:9)
					Use (Form:C1466.primesTestResults)
						Form:C1466.primesTestResults:=Form:C1466.primesTestResults.orderBy("max desc, msSum desc, function asc")
					End use 
					Form:C1466.sortOrderCol5:=ck descending:K85:8
					$0:=ck descending:K85:8
				Else 
					Use (Form:C1466.primesTestResults)
						Form:C1466.primesTestResults:=Form:C1466.primesTestResults.orderBy("max desc, msSum asc, function asc")
					End use 
					Form:C1466.sortOrderCol5:=ck ascending:K85:9
					$0:=ck ascending:K85:9
				End if 
				
			: (FORM Event:C1606.columnName="oColOk")
				If (Form:C1466.sortOrderCol6=ck ascending:K85:9)
					Use (Form:C1466.primesTestResults)
						Form:C1466.primesTestResults:=Form:C1466.primesTestResults.orderBy("ok desc")
					End use 
					Form:C1466.sortOrderCol6:=ck descending:K85:8
					$0:=ck descending:K85:8
				Else 
					Use (Form:C1466.primesTestResults)
						Form:C1466.primesTestResults:=Form:C1466.primesTestResults.orderBy("ok asc")
					End use 
					Form:C1466.sortOrderCol6:=ck ascending:K85:9
					$0:=ck ascending:K85:9
				End if 
				
		End case 
		
		
End case 

// - EOF -