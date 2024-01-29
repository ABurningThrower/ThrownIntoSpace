extends Node

var nextScene: PackedScene
var defaultScene: PackedScene = preload("res://files/scenes/Main-/crew.tscn")


func _ready():
	add_child(defaultScene.instantiate())
	instantiateButtons(get_tree().root)
	$"../Back Btn".append(defaultScene)


func instantiateButtons(node):
	for button in get_buttons(node):
		button.pressed.connect(buttonPress.bind(button))


func transitionScene(scene = null):
	$"../Transition Fade".transition(scene)
#	print($"../Back Btn".lastSceneList.map(func(scene): return scene.get_state().get_node_name(0)))


func buttonPress(button):
	nextScene = load(button.scenePath)
	transitionScene()


func get_buttons(node):
	var buttons = []
	for child in node.get_children():
		if child is TransitionButton:
			buttons.append(child)
		buttons.append_array(get_buttons(child))

	return buttons


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

