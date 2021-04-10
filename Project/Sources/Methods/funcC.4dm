//%attributes = {}
// PM: "funcB"
// $0 - C_BOOLEAN - OK
// $1 - C_OBJECT - Function object

C_BOOLEAN:C305($ok; $0)
C_OBJECT:C1216($obj; $1)

C_REAL:C285($max)
C_LONGINT:C283($step; $found; $limit; $last; $i)
C_BOOLEAN:C305($flag)

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
		
		$last:=2+2  //Last number that has been used
		$step:=2  //Step for this number
		$flag:=True:C214  //End of Job flag
		$limit:=($max^0.5)+1  //The last prime number cannot be greater then square root of the limit + 1
		
		//%R-
		$arIsNotPrime{0}:=True:C214  // 0 is never a prime
		$arIsNotPrime{1}:=True:C214  // 1 is never a prime (We use standard definition, otherwise/alternative set it to FALSE)
		//This loop can be almost completely debugged, and we can remove 
		//the Range Checking for this part. The following line does the job...
		While ($flag)
			For ($i; $last; $max; $step)  //We step and mark the multiples of $last
				$arIsNotPrime{$i}:=True:C214
			End for 
			$i:=$step+1  //We go to next seed
			While ($arIsNotPrime{$i})  //and it should not be prime
				$i:=$i+1
			End while   //so it is the next prime number, and we can remove its multiples.
			$last:=$i*2
			$step:=$i
			$flag:=($i<$limit)  //We stop if the limit is reached
		End while 
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