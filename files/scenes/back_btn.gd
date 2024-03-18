class_name BackButton
extends Button


@export var lastSceneList: Array[PackedScene] = []
@export var lastSceneDataList: Array[Array] = []



func append(scene = null, btnData = null) -> void:
	if scene != null:
		lastSceneList.append(scene)
#	if btnData.size() == 0 or 1:
#		lastSceneDataList.append([""])
#	else:
	if btnData != null:
		lastSceneDataList.append(btnData)


func clear() -> void:
	# for example when transferring to a scene where the player shouldn't be able to go back (i.e. in combat or decision scenes), clear the arrays here and then append the scene the player is on to it when it should be usable again
	lastSceneList.clear()
	lastSceneDataList.clear()
	lastSceneList.append(load(Settings.getSetting("settingsDict", "default_scene")))


func _pressed() -> void:
	lastSceneList.pop_back()
	lastSceneDataList.pop_back()
	var scene: PackedScene = lastSceneList.back()
	var data = lastSceneDataList.back()
	if lastSceneList.size() == 1 or 0:
		hide()
	else:
		show()
#	print(scene.get_state().get_node_name(0))
	$"../Scenes".transitionScene(scene, data)
	

func popBackData() -> void:
	lastSceneDataList.pop_back()
