Class extends _Form

property channels : Collection

Class constructor($channels : Collection)
	
	Super:C1705()
	
	This:C1470.channels:=$channels
	
	$window:=Open form window:C675("Inventory")
	DIALOG:C40("Inventory"; This:C1470; *)
	
Function onLoad()
	
	Form:C1466.Inventory:=cs:C1710.InventoryUI.new(cs:C1710.InventoryUI_WSC_Controller)
	
	Form:C1466.pages:={}
	Form:C1466.pages.values:=New collection:C1472("在庫管理"; "ストリーム"; "データ"; "デバッグ")
	Form:C1466.pages.index:=0
	
	Form:C1466.items:={col: []; sel: Null:C1517; item: Null:C1517; pos: Null:C1517}
	
	Form:C1466.info:={error: Null:C1517; terminate: Null:C1517}
	
	Form:C1466.update().toggle(False:C215)
	
Function onUnload()
	
	If (Form:C1466.Inventory.socket.status="Connected")
		Form:C1466.Inventory.socket.terminate()
	End if 
	
	//MARK:-
	
Function setCount($item : Object)
	
	Form:C1466.Inventory.socket.send({action: "setCount"; Id: $item.Id; count: $item.count})
	
	return Form:C1466
	
Function add($item : Object)
	
	$item.count+=1
	
	This:C1470.setCount($item)
	
	return Form:C1466
	
Function remove($item : Object)
	
	$item.count-=1
	
	This:C1470.setCount($item)
	
	return Form:C1466
	
Function toggle($enabled : Boolean)
	
	OBJECT SET ENABLED:C1123(*; "add"; $enabled)
	OBJECT SET ENABLED:C1123(*; "remove"; $enabled)
	OBJECT SET ENTERABLE:C238(*; "count"; $enabled)
	
	return Form:C1466
	
Function update()
	
	OBJECT SET ENABLED:C1123(*; "terminate"; Form:C1466.Inventory.socket.status="Connected")
	OBJECT SET ENABLED:C1123(*; "reconnect"; Form:C1466.Inventory.socket.status#"Connected")
	
	Form:C1466.Inventory.socket.status:=Form:C1466.Inventory.socket.status
	
	return Form:C1466
	
Function terminate()
	
	If (Form:C1466.Inventory.socket.status="Connected")
		Form:C1466.Inventory.socket.terminate()
	End if 
	
	return Form:C1466
	
Function reconnect()
	
	If (Form:C1466.Inventory.socket.status#"Connected")
		Form:C1466.Inventory:=cs:C1710.Inventory.new(This:C1470.channels; cs:C1710.InventoryUI_WSC_Controller)
		Form:C1466.info.error:=Null:C1517
		Form:C1466.info.terminate:=Null:C1517
	End if 
	
	return Form:C1466
	