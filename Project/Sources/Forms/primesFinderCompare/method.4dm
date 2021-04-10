// FM: "primesFinderCompare"

C_OBJECT:C1216($objA1; $objA2; $objA3; $objA4; $objA5)
C_OBJECT:C1216($objB1; $objB2; $objB3; $objB4; $objB5)
C_OBJECT:C1216($objC1; $objC2; $objC3; $objC4; $objC5)
C_OBJECT:C1216($objD1; $objD2; $objD3; $objD4; $objD5)
C_OBJECT:C1216($objE1; $objE2; $objE3; $objE4; $objE5)
C_OBJECT:C1216($objF1; $objF2; $objF3; $objF4; $objF5)

Case of 
	: (Form event code:C388=On Load:K2:1)
		Form:C1466.isCompiled:=Is compiled mode:C492
		Form:C1466.mode:=Choose:C955(Form:C1466.isCompiled; "compiled"; "interpreted")
		
		OBJECT SET VISIBLE:C603(*; "oInfoInterpreted@"; Not:C34(Form:C1466.isCompiled))
		OBJECT SET VISIBLE:C603(*; "oBtnTrace"; Not:C34(Form:C1466.isCompiled))
		setInfoInProgress(False:C215)
		
		Form:C1466.max100T:=100000
		Form:C1466.max1M:=1000000
		Form:C1466.max100M:=100000000
		Form:C1466.max1B:=1000000000
		Form:C1466.max2B:=2000000000
		// Form.max2B:=MAXLONG-16 // crash funcB
		
		If (Form:C1466.isCompiled)
			Form:C1466.maxLimit1M:=False:C215
			Form:C1466.maxLimit100M:=False:C215
			Form:C1466.maxLimitAll:=True:C214
		Else 
			Form:C1466.maxLimit1M:=True:C214
			Form:C1466.maxLimit100M:=False:C215
			Form:C1466.maxLimitAll:=False:C215
		End if 
		
		Form:C1466.version:=yGet4DVersionShortname
		
		SET WINDOW TITLE:C213("primesFinderCompare | "+Form:C1466.version+" | "+Form:C1466.mode; Current form window:C827)
		
		Form:C1466.sortOrderCol1:=ck ascending:K85:9
		Form:C1466.sortOrderCol2:=ck ascending:K85:9
		Form:C1466.sortOrderCol3:=ck ascending:K85:9
		Form:C1466.sortOrderCol4:=ck ascending:K85:9
		Form:C1466.sortOrderCol5:=ck ascending:K85:9
		Form:C1466.sortOrderCol6:=ck ascending:K85:9
		
		Form:C1466.primesTestResults:=New shared collection:C1527
		
		$objA1:=New shared object:C1526
		$objA2:=New shared object:C1526
		$objA3:=New shared object:C1526
		$objA4:=New shared object:C1526
		$objA5:=New shared object:C1526
		
		$objB1:=New shared object:C1526
		$objB2:=New shared object:C1526
		$objB3:=New shared object:C1526
		$objB4:=New shared object:C1526
		$objB5:=New shared object:C1526
		
		$objC1:=New shared object:C1526
		$objC2:=New shared object:C1526
		$objC3:=New shared object:C1526
		$objC4:=New shared object:C1526
		$objC5:=New shared object:C1526
		
		$objD1:=New shared object:C1526
		$objD2:=New shared object:C1526
		$objD3:=New shared object:C1526
		$objD4:=New shared object:C1526
		$objD5:=New shared object:C1526
		
		$objE1:=New shared object:C1526
		$objE2:=New shared object:C1526
		$objE3:=New shared object:C1526
		$objE4:=New shared object:C1526
		$objE5:=New shared object:C1526
		
		$objF1:=New shared object:C1526
		$objF2:=New shared object:C1526
		$objF3:=New shared object:C1526
		$objF4:=New shared object:C1526
		$objF5:=New shared object:C1526
		
		Use ($objA1)
			$objA1.function:="funcA"
			$objA1.ms:=(-1)
			$objA1.msAlloc:=(-1)
			$objA1.msSum:=(-1)
			$objA1.max:=Form:C1466.max100T
			$objA1.ok:=False:C215
			$objA1.found:=(-1)
			$objA1.test:=(-1)
		End use 
		Use ($objA2)
			$objA2.function:="funcA"
			$objA2.ms:=(-1)
			$objA2.msAlloc:=(-1)
			$objA2.msSum:=(-1)
			$objA2.max:=Form:C1466.max1M
			$objA2.ok:=False:C215
			$objA2.found:=(-1)
			$objA2.test:=(-1)
		End use 
		Use ($objA3)
			$objA3.function:="funcA"
			$objA3.ms:=(-1)
			$objA3.msAlloc:=(-1)
			$objA3.msSum:=(-1)
			$objA3.max:=Form:C1466.max100M
			$objA3.ok:=False:C215
			$objA3.found:=(-1)
			$objA3.test:=(-1)
		End use 
		Use ($objA4)
			$objA4.function:="funcA"
			$objA4.ms:=(-1)
			$objA4.msAlloc:=(-1)
			$objA4.msSum:=(-1)
			$objA4.max:=Form:C1466.max1B
			$objA4.ok:=False:C215
			$objA4.found:=(-1)
			$objA4.test:=(-1)
		End use 
		Use ($objA5)
			$objA5.function:="funcA"
			$objA5.ms:=(-1)
			$objA5.msAlloc:=(-1)
			$objA5.msSum:=(-1)
			$objA5.max:=Form:C1466.max2B
			$objA5.ok:=False:C215
			$objA5.found:=(-1)
			$objA5.test:=(-1)
		End use 
		
		Use ($objB1)
			$objB1.function:="funcB"
			$objB1.ms:=(-1)
			$objB1.msAlloc:=(-1)
			$objB1.msSum:=(-1)
			$objB1.max:=Form:C1466.max100T
			$objB1.ok:=False:C215
			$objB1.found:=(-1)
			$objB1.test:=(-1)
		End use 
		Use ($objB2)
			$objB2.function:="funcB"
			$objB2.ms:=(-1)
			$objB2.msAlloc:=(-1)
			$objB2.msSum:=(-1)
			$objB2.max:=Form:C1466.max1M
			$objB2.ok:=False:C215
			$objB2.found:=(-1)
			$objB2.test:=(-1)
		End use 
		Use ($objB3)
			$objB3.function:="funcB"
			$objB3.ms:=(-1)
			$objB3.msAlloc:=(-1)
			$objB3.msSum:=(-1)
			$objB3.max:=Form:C1466.max100M
			$objB3.ok:=False:C215
			$objB3.found:=(-1)
			$objB3.test:=(-1)
		End use 
		Use ($objB4)
			$objB4.function:="funcB"
			$objB4.ms:=(-1)
			$objB4.msAlloc:=(-1)
			$objB4.msSum:=(-1)
			$objB4.max:=Form:C1466.max1B
			$objB4.ok:=False:C215
			$objB4.found:=(-1)
			$objB4.test:=(-1)
		End use 
		Use ($objB5)
			$objB5.function:="funcB"
			$objB5.ms:=(-1)
			$objB5.msAlloc:=(-1)
			$objB5.msSum:=(-1)
			$objB5.max:=Form:C1466.max2B
			$objB5.ok:=False:C215
			$objB5.found:=(-1)
			$objB5.test:=(-1)
		End use 
		
		Use ($objC1)
			$objC1.function:="funcC"
			$objC1.ms:=(-1)
			$objC1.msAlloc:=(-1)
			$objC1.msSum:=(-1)
			$objC1.max:=Form:C1466.max100T
			$objC1.ok:=False:C215
			$objC1.found:=(-1)
			$objC1.test:=(-1)
		End use 
		Use ($objC2)
			$objC2.function:="funcC"
			$objC2.ms:=(-1)
			$objC2.msAlloc:=(-1)
			$objC2.msSum:=(-1)
			$objC2.max:=Form:C1466.max1M
			$objC2.ok:=False:C215
			$objC2.found:=(-1)
			$objC2.test:=(-1)
		End use 
		Use ($objC3)
			$objC3.function:="funcC"
			$objC3.ms:=(-1)
			$objC3.msAlloc:=(-1)
			$objC3.msSum:=(-1)
			$objC3.max:=Form:C1466.max100M
			$objC3.ok:=False:C215
			$objC3.found:=(-1)
			$objC3.test:=(-1)
		End use 
		Use ($objC4)
			$objC4.function:="funcC"
			$objC4.ms:=(-1)
			$objC4.msAlloc:=(-1)
			$objC4.msSum:=(-1)
			$objC4.max:=Form:C1466.max1B
			$objC4.ok:=False:C215
			$objC4.found:=(-1)
			$objC4.test:=(-1)
		End use 
		Use ($objC5)
			$objC5.function:="funcC"
			$objC5.ms:=(-1)
			$objC5.msAlloc:=(-1)
			$objC5.msSum:=(-1)
			$objC5.max:=Form:C1466.max2B
			$objC5.ok:=False:C215
			$objC5.found:=(-1)
			$objC5.test:=(-1)
		End use 
		
		Use ($objD1)
			$objD1.function:="funcD"
			$objD1.ms:=(-1)
			$objD1.msAlloc:=(-1)
			$objD1.msSum:=(-1)
			$objD1.max:=Form:C1466.max100T
			$objD1.ok:=False:C215
			$objD1.found:=(-1)
			$objD1.test:=(-1)
		End use 
		Use ($objD2)
			$objD2.function:="funcD"
			$objD2.ms:=(-1)
			$objD2.msAlloc:=(-1)
			$objD2.msSum:=(-1)
			$objD2.max:=Form:C1466.max1M
			$objD2.ok:=False:C215
			$objD2.found:=(-1)
			$objD2.test:=(-1)
		End use 
		Use ($objD3)
			$objD3.function:="funcD"
			$objD3.ms:=(-1)
			$objD3.msAlloc:=(-1)
			$objD3.msSum:=(-1)
			$objD3.max:=Form:C1466.max100M
			$objD3.ok:=False:C215
			$objD3.found:=(-1)
			$objD3.test:=(-1)
		End use 
		Use ($objD4)
			$objD4.function:="funcD"
			$objD4.ms:=(-1)
			$objD4.msAlloc:=(-1)
			$objD4.msSum:=(-1)
			$objD4.max:=Form:C1466.max1B
			$objD4.ok:=False:C215
			$objD4.found:=(-1)
			$objD4.test:=(-1)
		End use 
		Use ($objD5)
			$objD5.function:="funcD"
			$objD5.ms:=(-1)
			$objD5.msAlloc:=(-1)
			$objD5.msSum:=(-1)
			$objD5.max:=Form:C1466.max2B
			$objD5.ok:=False:C215
			$objD5.found:=(-1)
			$objD5.test:=(-1)
		End use 
		
		Use ($objE1)
			$objE1.function:="funcE"
			$objE1.ms:=(-1)
			$objE1.msAlloc:=(-1)
			$objE1.msSum:=(-1)
			$objE1.max:=Form:C1466.max100T
			$objE1.ok:=False:C215
			$objE1.found:=(-1)
			$objE1.test:=(-1)
		End use 
		Use ($objE2)
			$objE2.function:="funcE"
			$objE2.ms:=(-1)
			$objE2.msAlloc:=(-1)
			$objE2.msSum:=(-1)
			$objE2.max:=Form:C1466.max1M
			$objE2.ok:=False:C215
			$objE2.found:=(-1)
			$objE2.test:=(-1)
		End use 
		Use ($objE3)
			$objE3.function:="funcE"
			$objE3.ms:=(-1)
			$objE3.msAlloc:=(-1)
			$objE3.msSum:=(-1)
			$objE3.max:=Form:C1466.max100M
			$objE3.ok:=False:C215
			$objE3.found:=(-1)
			$objE3.test:=(-1)
		End use 
		Use ($objE4)
			$objE4.function:="funcE"
			$objE4.ms:=(-1)
			$objE4.msAlloc:=(-1)
			$objE4.msSum:=(-1)
			$objE4.max:=Form:C1466.max1B
			$objE4.ok:=False:C215
			$objE4.found:=(-1)
			$objE4.test:=(-1)
		End use 
		Use ($objE5)
			$objE5.function:="funcE"
			$objE5.ms:=(-1)
			$objE5.msAlloc:=(-1)
			$objE5.msSum:=(-1)
			$objE5.max:=Form:C1466.max2B
			$objE5.ok:=False:C215
			$objE5.found:=(-1)
			$objE5.test:=(-1)
		End use 
		
		Use ($objF1)
			$objF1.function:="funcF"
			$objF1.ms:=(-1)
			$objF1.msAlloc:=(-1)
			$objF1.msSum:=(-1)
			$objF1.max:=Form:C1466.max100T
			$objF1.ok:=False:C215
			$objF1.found:=(-1)
			$objF1.test:=(-1)
		End use 
		Use ($objF2)
			$objF2.function:="funcF"
			$objF2.ms:=(-1)
			$objF2.msAlloc:=(-1)
			$objF2.msSum:=(-1)
			$objF2.max:=Form:C1466.max1M
			$objF2.ok:=False:C215
			$objF2.found:=(-1)
			$objF2.test:=(-1)
		End use 
		Use ($objF3)
			$objF3.function:="funcF"
			$objF3.ms:=(-1)
			$objF3.msAlloc:=(-1)
			$objF3.msSum:=(-1)
			$objF3.max:=Form:C1466.max100M
			$objF3.ok:=False:C215
			$objF3.found:=(-1)
			$objF3.test:=(-1)
		End use 
		Use ($objF4)
			$objF4.function:="funcF"
			$objF4.ms:=(-1)
			$objF4.msAlloc:=(-1)
			$objF4.msSum:=(-1)
			$objF4.max:=Form:C1466.max1B
			$objF4.ok:=False:C215
			$objF4.found:=(-1)
			$objF4.test:=(-1)
		End use 
		Use ($objF5)
			$objF5.function:="funcF"
			$objF5.ms:=(-1)
			$objF5.msAlloc:=(-1)
			$objF5.msSum:=(-1)
			$objF5.max:=Form:C1466.max2B
			$objF5.ok:=False:C215
			$objF5.found:=(-1)
			$objF5.test:=(-1)
		End use 
		
		Use (Form:C1466.primesTestResults)
			
			Form:C1466.primesTestResults.push($objA1)
			Form:C1466.primesTestResults.push($objA2)
			Form:C1466.primesTestResults.push($objA3)
			Form:C1466.primesTestResults.push($objA4)
			Form:C1466.primesTestResults.push($objA5)
			
			Form:C1466.primesTestResults.push($objB1)
			Form:C1466.primesTestResults.push($objB2)
			Form:C1466.primesTestResults.push($objB3)
			Form:C1466.primesTestResults.push($objB4)
			Form:C1466.primesTestResults.push($objB5)
			
			Form:C1466.primesTestResults.push($objC1)
			Form:C1466.primesTestResults.push($objC2)
			Form:C1466.primesTestResults.push($objC3)
			Form:C1466.primesTestResults.push($objC4)
			Form:C1466.primesTestResults.push($objC5)
			
			Form:C1466.primesTestResults.push($objD1)
			Form:C1466.primesTestResults.push($objD2)
			Form:C1466.primesTestResults.push($objD3)
			Form:C1466.primesTestResults.push($objD4)
			Form:C1466.primesTestResults.push($objD5)
			
			Form:C1466.primesTestResults.push($objE1)
			Form:C1466.primesTestResults.push($objE2)
			Form:C1466.primesTestResults.push($objE3)
			Form:C1466.primesTestResults.push($objE4)
			Form:C1466.primesTestResults.push($objE5)
			
			Form:C1466.primesTestResults.push($objF1)
			Form:C1466.primesTestResults.push($objF2)
			Form:C1466.primesTestResults.push($objF3)
			Form:C1466.primesTestResults.push($objF4)
			Form:C1466.primesTestResults.push($objF5)
			
		End use 
		
End case 

// - EOF -