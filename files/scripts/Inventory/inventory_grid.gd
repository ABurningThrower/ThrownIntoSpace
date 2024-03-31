## Gridcontainer which automatically populates itself with inventory slots.
class_name InventoryGrid
extends GridContainer


enum Type {
	CHARACTER,
	SHIP	
} 
var inventory: Array
@export var inventoryType: Type

func _ready() -> void:
	if inventoryType == Type.CHARACTER:
		inventory = Settings.masterDict.charInventoryDict
	elif inventoryType == Type.SHIP:
		inventory = Settings.masterDict.shipInventoryDict
	populate()


func populate(slots: int = 80) -> void:
	for i in slots:
		var slot := InventorySlot.new()
		slot.init(ItemData.Type.MAIN, Vector2(64, 64))
		self.add_child(slot)

	for i in inventory.size():
		var item := InventoryItem.new()
		item.init(load(inventory[i]))
		self.get_child(i).add_child(item)


