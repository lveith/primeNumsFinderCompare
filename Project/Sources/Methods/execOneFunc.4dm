//%attributes = {}
// PM: "execOneFunc"
// $0 - C_BOOLEAN - OK
// $1 - C_OBJECT - Function object

C_BOOLEAN:C305($ok; $0)
C_OBJECT:C1216($obj; $1)

If (Count parameters:C259>0)
	$obj:=$1
End if 

ARRAY TEXT:C222($methodNames; 0)
// METHOD GET NAMES($methodNames)
ARRAY TEXT:C222($methodNames; 6)
$methodNames{1}:="funcA"
$methodNames{2}:="funcB"
$methodNames{3}:="funcC"
//$methodNames{4}:="funcD"
//$methodNames{5}:="funcE"
//$methodNames{6}:="funcF"

Case of 
	: (Value type:C1509($obj)#Is object:K8:27)
	: ($obj=Null:C1517)
	: (Value type:C1509($obj.function)#Is text:K8:3)
	: (Find in array:C230($methodNames; $obj.function)<1)
	Else 
		EXECUTE METHOD:C1007($obj.function; $ok; $obj)
End case 

$0:=$ok

// - EOF -