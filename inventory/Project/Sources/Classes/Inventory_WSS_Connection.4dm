Class extends _WSS_Connection

property remoteAddress : Text
property url : Text

Class constructor($connection : cs:C1710._Connection)
	
	Super:C1705()
	
	This:C1470.remoteAddress:=$connection.request.remoteAddress
	This:C1470.url:=$connection.request.url
	
	This:C1470.ORDA:={}
	
Function onMessage($socket : 4D:C1709.WebSocketConnection; $message : cs:C1710._Message)
	
	Case of 
		: ($socket.wss.dataType="object")
			
			Case of 
				: ($message.data.action="setCount")
					
					$status:=ds:C1482.Items.setCount($message.data.Id; $message.data.count)
					
					If ($status.success)
						var $connection : Object
						For each ($connection; $socket.wss.connections.query("id != :1"; $socket.id))
							$connection.send({item: {Id: $status.item.Id; count: $status.item.count}})
						End for each 
					End if 
					
					$socket.send({item: {Id: $status.item.Id; count: $status.item.count}})
					
			End case 
			
	End case 
	
	$socket.handler.instance.stream:=$message
	$socket.handler.instance.connection:=This:C1470
	
Function onOpen($socket : 4D:C1709.WebSocketConnection; $open : cs:C1710._Open)
	
	$remoteAddress:=$socket.handler.remoteAddress
	
	$socket.send({inventory: ds:C1482.Items.list})
	
	$socket.handler.instance.stream:=$open
	$socket.handler.instance.connection:=This:C1470
	
Function onTerminate($socket : 4D:C1709.WebSocketConnection; $terminate : cs:C1710._Terminate)
	
	$socket.handler.instance.stream:=$terminate
	$socket.handler.instance.connection:=This:C1470
	
Function onError($socket : 4D:C1709.WebSocketConnection; $error : cs:C1710._Error)
	
	$socket.handler.instance.stream:=$error
	$socket.handler.instance.connection:=This:C1470