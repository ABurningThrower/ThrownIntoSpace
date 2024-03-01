## The action (texture) within an inventory slot, setting texture based on ItemData.
class_name BattleAction
extends TextureRect


@export var data: BattleActionData


func _ready() -> void:
	expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	texture = data.icon
#	if data.description != "":
#		tooltip_text = "%s\n%s" % [data.name, data.description]



func init(d: BattleActionData) -> void:
	data = d
