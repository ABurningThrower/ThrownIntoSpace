## An informatory image which displays informatory tooltip on hover.
class_name InfoTooltip
extends TextureRect

## Pinned property for easier use.
@export var tooltip: String = ""


func _ready() -> void:
	if tooltip != "":
		self.tooltip_text = tooltip
