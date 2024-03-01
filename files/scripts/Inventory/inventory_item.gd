## The item (texture) within an inventory slot, setting texture based on ItemData.
class_name InventoryItem
extends TextureRect


@export var data: ItemData = get("res://files/resources/Items/fallback_item.tres")


func _ready() -> void:
	expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	texture = data.texture
	if data.description != "":
		tooltip_text = "[b]%s[/b]\n%s" % [data.name, data.description]
	


func _make_custom_tooltip(_text):
	var t: Array = _text.split("\n")
	var tooltip = preload("res://files/scenes/inventory_tooltip.tscn").instantiate()
	tooltip.get_node("Header").text = t[0]
	tooltip.get_node("Description").text = t[1]
	return tooltip
	
	
'''
func _make_custom_tooltip(for_text):
	var label = RichTextLabel.new()
	label.bbcode_enabled = true
	label.custom_minimum_size = Vector2(200,200)
	label.push_bold()
	label.append_text(for_text)
	label.pop()
	return label
'''

func init(d: ItemData) -> void:
	data = d
