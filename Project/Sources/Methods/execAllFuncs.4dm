//%attributes = {"preemptive":"capable"}
// PM: "execAllFuncs"
// $1 - C_COLLECTION - Listbox collection
// $2 - C_LONGINT - Limit of max to exec
// $3 - C_LONGINT - Window reference number of the window displaying the called form

C_COLLECTION:C1488($col; $1)
C_LONGINT:C283($maxLimit; $2)
C_LONGINT:C283($winRef; $3)

C_BOOLEAN:C305($ok)
C_OBJECT:C1216($obj)

If (Count parameters:C259>0)
	$col:=$1
	If (Count parameters:C259>1)
		$maxLimit:=$2
		If (Count parameters:C259>2)
			$winRef:=$3
		End if 
	End if 
End if 

If ($col#Null:C1517)
	For each ($obj; $col)
		Case of 
			: ($obj=Null:C1517)
			: (Value type:C1509($obj.max)#Is real:K8:4)
			: ($obj.max>$maxLimit)
			Else 
				$ok:=execOneFunc($obj)
				CALL FORM:C1391($winRef; "refreshListbox")
				DELAY PROCESS:C323(Current process:C322; 20)
		End case 
	End for each 
	
	CALL FORM:C1391($winRef; "refreshListbox")
	CALL FORM:C1391($winRef; "setInfoInProgress"; False:C215)
	
	$ok:=True:C214
End if 

// - EOF -