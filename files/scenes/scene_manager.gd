extends Node

var nextScene: PackedScene
var defaultScene: PackedScene = preload("res://files/scenes/Main-/crew.tscn")


func _ready():
	add_child(defaultScene.instantiate())
	instantiateButtons(get_tree().root)
	$"../Back Btn".append(defaultScene)



func buttonPress(button):
	# Doesn't transition if user is already in the target scene
	if button.scenePath != get_child(0).scene_file_path:
		nextScene = load(button.scenePath)
		transitionScene()



func transitionScene(scene = null):
	$"../Transition Fade".transition(scene)
#	print($"../Back Btn".lastSceneList.map(func(scene): return scene.get_state().get_node_name(0)))



func _on_transition_fade_transitioned(scene = null):
#	print(scene)
	# when transitioning forward, the back button gets an extra
	if scene == null:
		$"../Back Btn".append(nextScene)
		$"../Back Btn".appear()
	else:
		nextScene = scene
	if get_children().size() > 0:
		get_child(0).queue_free()
	var nodeScene = nextScene.instantiate()
	add_child(nodeScene)
	instantiateButtons(nodeScene)
	$"../Transition Fade".fadein()





func instantiateButtons(node) -> void:
	for button in get_buttons(node):
		button.pressed.connect(buttonPress.bind(button))


func get_buttons(node) -> Array:
	var buttons:= []
	for child in node.get_children():
		if child is TransitionButton:
			buttons.append(child)
		buttons.append_array(get_buttons(child))

	return buttons
