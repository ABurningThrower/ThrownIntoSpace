extends CanvasLayer

signal transitioned

var cScene


func _init() -> void:
	visible = true

func _ready() -> void:
	fadein()

func transition(scene) -> void:
	cScene = scene
	$AnimationPlayer.play("fade_out")

func fadein() -> void:
	$AnimationPlayer.play("fade_in")


func _on_animation_player_animation_finished(anim_name) -> void:
	# does fade in anim once done with fade out
	if anim_name == "fade_out":
		emit_signal("transitioned", cScene)


