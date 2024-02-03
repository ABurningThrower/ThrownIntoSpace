class_name TransitionButton
extends Button

signal transPress()
@export var scenePath: String



func _pressed():
	emit_signal("transPress")
