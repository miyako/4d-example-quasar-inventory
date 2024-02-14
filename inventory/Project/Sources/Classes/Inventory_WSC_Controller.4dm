Class extends _WSC_Controller

Class constructor($dataType : Text)
	
	Super:C1705($dataType)
	
Function onMessage($socket : 4D:C1709.WebSocket; $message : cs:C1710._Message)
	
	If ($socket.dataType="object")
		
		$instance:=This:C1470.instance
		
		var $data : Object
		
		$data:=$instance.data
		$instance.stream:=$message.data
		
		Case of 
			: ($message.data.inventory#Null:C1517)
				$data.items:=$message.data.inventory
				
			: ($message.data.item#Null:C1517)
				$items:=$data.items.query("Id == :1"; $message.data.item.Id)
				If ($items.length#0)
					$item:=$items[0]
					$item.count:=$message.data.item.count
				End if 
		End case 
		
	End if 
	
Function onTerminate($socket : 4D:C1709.WebSocket; $terminate : cs:C1710._Terminate)
	
	KILL WORKER:C1390