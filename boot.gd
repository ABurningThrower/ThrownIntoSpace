extends Node


func _ready() -> void:

	if not Saver.hasData():
		Saver.setToDefault()
		Saver.save()

	# check if user has logged in before
	Settings.masterDict = Saver.load()



func _process(_delta) -> void:
	if Settings.masterDict["userDict"]["player"] != null and Settings.masterDict["userDict"]["login_key"] != null:
		get_tree().change_scene_to_file("res://files/scenes/main.tscn")
#		@warning_ignore("")
	else:
		get_tree().change_scene_to_file("res://files/scenes/login.tscn")
#		@warning_ignore("")
	
	
	queue_free()

