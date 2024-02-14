Class extends _WSC

property data : Object
property stream : Object

Class constructor($controller : cs:C1710._WSC_Controller)
	
	$endpoint:="ws://localhost/inventory"
	
	Case of 
		: (OB Instance of:C1731($controller; OB Class:C1730(cs:C1710._WSC_Controller)))
			Super:C1705($endpoint; $controller; "object")
		Else 
			Super:C1705($endpoint; cs:C1710.Inventory_WSC_Controller; "object")
	End case 
	
	This:C1470.data:={}
	This:C1470.stream:={}