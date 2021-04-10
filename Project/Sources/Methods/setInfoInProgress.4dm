//%attributes = {}
// PM: "setInfoInProgress"
// $1 - C_BOOLEAN - Set InfoInProgress visible

C_BOOLEAN:C305($visible; $1)

If (Count parameters:C259>0)
	$visible:=$1
End if 

OBJECT SET VISIBLE:C603(*; "oInfoInProgress@"; $visible)
REDRAW WINDOW:C456(Current form window:C827)

// - EOF -