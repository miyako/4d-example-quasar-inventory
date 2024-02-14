//%attributes = {"invisible":true}
var $item : cs:C1710.ItemsEntity

$item:=ds:C1482.Items.new()
$item.name:="商品1"
$item.count:=10
$item.save()

$item:=ds:C1482.Items.new()
$item.name:="商品2"
$item.count:=20
$item.save()

$item:=ds:C1482.Items.new()
$item.name:="商品3"
$item.count:=30
$item.save()