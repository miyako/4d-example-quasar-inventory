Class extends Inventory_WSC_Controller

Class constructor($dataType : Text)
	
	Super:C1705($dataType)
	
Function onMessage($socket : 4D:C1709.WebSocket; $message : cs:C1710._Message)
	
	Super:C1706.onMessage($socket; $message)
	
	If (Form:C1466#Null:C1517)
		
		Form:C1466.items.col:=This:C1470.instance.data.items
		
		If (FORM Get current page:C276=3)
			Form:C1466.Inventory.data:=Form:C1466.Inventory.data
		End if 
		
	End if 
	
Function onError($socket : 4D:C1709.WebSocket; $error : cs:C1710._Error)
	
	If (Form:C1466#Null:C1517)
		Form:C1466.info.error:=$error
		Form:C1466.Inventory.socket.status:=Form:C1466.Inventory.socket.status
	End if 
	
Function onTerminate($socket : 4D:C1709.WebSocket; $terminate : cs:C1710._Terminate)
	
	If (Form:C1466#Null:C1517)
		Form:C1466.info.terminate:=$terminate
		Form:C1466.update().toggle(False:C215)
	End if 