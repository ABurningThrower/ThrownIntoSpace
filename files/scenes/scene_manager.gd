extends Node

var nextScene: PackedScene
var btnData: Array
@onready var defaultScene: PackedScene = load(Settings.masterDict["settingsDict"]["default_scene"])


func _ready() -> void:
	add_child(defaultScene.instantiate())
	instantiateButtons(get_tree().root)
	$"../Back Btn".append(defaultScene, null)


func buttonPress(button) -> void:
	# if button has data, keeps it here to transfer to next scene
	btnData = button.data
	
	# Doesn't transition if user is already in the target scene	
	if button.scenePath != get_child(0).scene_file_path or btnData.has("TRANSITION_OVERRIDE") == true:
		nextScene = load(button.scenePath)
		transitionScene(null)
	
	



func transitionScene(scene = null, _btnData = null) -> void:
	$"../Transition Fade".transition(scene)
#	print($"../Back Btn".lastSceneList.map(func(scene): return scene.get_state().get_node_name(0)))
		
	if _btnData == btnData && _btnData != []:
		$"../Back Btn".popBackData()
	elif _btnData != null:
		btnData = _btnData
		$"../Back Btn".popBackData()
	


func _on_transition_fade_transitioned(scene = null) -> void:
	# when transitioning forward, the back button gains a scene to it's list
	if scene == null:
		$"../Back Btn".append(nextScene, btnData)
		$"../Back Btn".show()
	else:
		$"../Back Btn".append(null, btnData)
		nextScene = scene
	if get_children().size() > 0:
		get_child(0).queue_free()
	var nodeScene = nextScene.instantiate()
	if nodeScene.has_method("initData"):
		nodeScene.initData(btnData)
	add_child(nodeScene)
	instantiateButtons(nodeScene)
#	emit_signal("dataReady", btnData)
	$"../Sidebar".visible = false
	$"../Music Player".disappear()
	$"../Transition Fade".fadein()
	





func instantiateButtons(node) -> void:
	for button in get_buttons(node):
		button.pressed.connect(buttonPress.bind(button))


func get_buttons(node) -> Array:
	var buttons:= []
	for child in node.get_children():
		if child is TransitionButton:
			buttons.append(child)
#		elif child is BackButton:
#			buttons.append(child)
		buttons.append_array(get_buttons(child))

	return buttons
