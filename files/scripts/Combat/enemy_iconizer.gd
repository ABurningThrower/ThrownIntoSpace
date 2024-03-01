## Custom Marginized container for holding EnemyPfps
class_name EnemyIconizer
extends PanelContainer



@export var type: CharData.Type



func init(t: CharData.Type, cms: Vector2) -> void:
	type = t
	custom_minimum_size = cms
