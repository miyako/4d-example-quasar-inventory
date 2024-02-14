Class extends DataClass

Function get list() : Collection
	
	return This:C1470.all().toCollection()
	
Function setCount($id : Integer; $count : Integer) : Object
	
	var $item : cs:C1710.ItemsEntity
	
	$item:=This:C1470.get($id)
	
	If ($item=Null:C1517)
		return {success: False:C215}
	End if 
	
	$item.count:=$count
	
	$success:=$item.save(dk auto merge:K85:24).success
	
	If (Not:C34($success))
		$item.reload()
	End if 
	
	return {success: $success; item: $item.toObject()}