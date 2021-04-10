//%attributes = {}
// PM: "funcA"
// $0 - C_BOOLEAN - OK
// $1 - C_OBJECT - Function object

C_BOOLEAN:C305($ok; $0)
C_OBJECT:C1216($obj; $1)

C_REAL:C285($max)
C_LONGINT:C283($pos; $nSize; $step; $found; $i)

C_LONGINT:C283($msStartAlloc; $msEndAlloc)
C_LONGINT:C283($msStart; $msEnd)

If (Count parameters:C259>0)
	$obj:=$1
End if 

BEEP:C151

Case of 
	: (Value type:C1509($obj)#Is object:K8:27)
	: ($obj=Null:C1517)
	: (Value type:C1509($obj.function)#Is text:K8:3)
	: ($obj.function#Current method name:C684)
	: (Value type:C1509($obj.max)#Is real:K8:4)
	Else 
		Error:=0
		$max:=Abs:C99($obj.max)
		If ($max<3)
			$max:=3
		End if 
		
		$msStartAlloc:=Milliseconds:C459
		ARRAY BOOLEAN:C223($arIsNotPrime; 0)
		ARRAY BOOLEAN:C223($arIsNotPrime; $max)
		$msEndAlloc:=Milliseconds:C459
		
		$msStart:=Milliseconds:C459
		
		$pos:=3
		$nSize:=Trunc:C95($max/$pos; 0)
		$step:=2
		
		//%R-
		$arIsNotPrime{0}:=True:C214  // 0 is never a prime
		$arIsNotPrime{1}:=True:C214  // 1 is never a prime (We use standard definition, otherwise/alternative set it to FALSE)
		While ($nSize>=$pos)
			For ($i; $pos; $nSize; $step)
				$arIsNotPrime{$pos*$i}:=True:C214
			End for 
			$pos:=$pos+2
			While ($arIsNotPrime{$pos})  // skip flagged entries
				$pos:=$pos+2
			End while 
			$nSize:=Trunc:C95($max/$pos; 0)
		End while 
		For ($i; 4; $max; 2)
			$arIsNotPrime{$i}:=True:C214  // is not a prime because ((($i%2)=0)=True)
		End for 
		//%R+
		
		$found:=Count in array:C907($arIsNotPrime; False:C215)
		
		$msEnd:=Milliseconds:C459
		$ok:=(Error=0)
End case 

If ($ok)
	Use ($obj)
		$obj.msAlloc:=$msEndAlloc-$msStartAlloc
		$obj.ms:=$msEnd-$msStart
		$obj.msSum:=$obj.msAlloc+$obj.ms
		$obj.ok:=$ok
		$obj.found:=$found
	End use 
Else 
	Use ($obj)
		$obj.msAlloc:=(-1)
		$obj.ms:=(-1)
		$obj.msSum:=(-1)
		$obj.ok:=$ok
		$obj.found:=(-1)
	End use 
End if 

BEEP:C151

$0:=$ok

// - EOF -