extends CanvasLayer

signal transitioned

var cScene


func _init():
	visible = true

func _ready():
	fadein()

func transition(scene):
	cScene = scene
	$AnimationPlayer.play("fade_out")

func fadein():
	$AnimationPlayer.play("fade_in")


func _on_animation_player_animation_finished(anim_name):
	# does fade in anim once done with fade out
	if anim_name == "fade_out":
		emit_signal("transitioned", cScene)


