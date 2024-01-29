extends Node

'''
func _ready():

	var saveData = Saver.load()
	# check if user has data
	
	# if so go to default scene, checking if user has set it to something else
	if saveData.userDict.character and saveData.userDict.login_key != null:
		get_tree().change_scene_to_file("res://files/scenes/main.tscn")
	# else go to login scene
	else:
		get_tree().change_scene_to_file("res://files/scenes/login.tscn")
	
	
	queue_free()
'''
