//%attributes = {"invisible":true}
#DECLARE($params : Object)

If (Count parameters:C259=0)
	
	CALL WORKER:C1389("Inventory"; Current method name:C684; {})
	
Else 
	
	$instance:=cs:C1710.Inventory.new()
	
End if 