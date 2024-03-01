## The enemy (texture) within an enemy iconizer, setting texture based on EnemyData.
class_name Enemy
extends TextureRect


@export var data: CharData


func _ready() -> void:
	expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	texture = data.pfp
#	if data.description != "":
#		tooltip_text = "%s\n%s" % [data.name, data.description]



func init(d: CharData) -> void:
	data = d
