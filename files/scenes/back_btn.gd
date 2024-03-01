extends Button

var lastSceneList: Array[PackedScene]



func appear():
	self.visible = true

func disappear():
	self.visible = false


func append(scene):
	lastSceneList.append(scene)
#	print("Scene appended: " + scene.get_state().get_node_name(0))
#	print("Current size: " + str(lastSceneList.size()))


func clear():
	# for example when transferring to a scene where the player shouldn't be able to go back (i.e. in combat or decision scenes), clear the Array here and then append the scene the player is on to it when it should be usable again
	pass


func _pressed():
	lastSceneList.pop_back()
	var scene: PackedScene = lastSceneList.back()
	if lastSceneList.size() == 1 or 0:
		disappear()
	else:
		appear()
#aa	print(scene.get_state().get_node_name(0))
	$"../Scenes".transitionScene(scene)
	
