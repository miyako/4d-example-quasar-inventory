Class extends _WSS

property stream : Object

Class constructor($controller : cs:C1710._WSS_Controller)
	
	$path:="/inventory"
	
	Case of 
		: (OB Instance of:C1731($controller; OB Class:C1730(cs:C1710._WSS_Controller)))
			Super:C1705($path; $controller; "object")
		Else 
			Super:C1705($path; cs:C1710.Inventory_WSS_Controller; "object")
	End case 
	
	This:C1470.stream:={}
	This:C1470.path:=$path
	