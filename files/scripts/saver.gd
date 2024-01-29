class_name Saver

static var savePath : String = "user://save.tres"

static var masterDict:= {
	userDict = {
		"character": null,
		"login_key": null
	},
	settingsDict = {
		"volume": 60.0,
		"default_scene": preload("res://files/scenes/Main-/crew.tscn")
	}
}

static func save() -> void:
#	ResourceSaver.save(savePath, self)
	var writer = FileAccess.open("user://save.tres", FileAccess.WRITE)
	
	

	# JSON provides a static method to serialized JSON string.
	var json_string = JSON.stringify(masterDict)

	# Store the save dictionary as a new line in the save file.
	writer.store_line(json_string)
	


static func load() -> Dictionary:
	# check if savefile exists
	if not FileAccess.file_exists(savePath):
		return {} # Error! We don't have a save to load.
	
	# if it does 
	var reader = FileAccess.open(savePath, FileAccess.READ)
	var json_string = reader.get_line()

	# Creates the helper class to interact with JSON
	var json = JSON.new()

	# Check if there is any error while parsing the JSON string, skip in case of failure
	var parse_result = json.parse(json_string)
	if not parse_result == OK:
		print("JSON Parse Error: ", json.get_error_message(), " in ", json_string, " at line ", json.get_error_line())
		return {}
	
	
	return json.data


static func updateData(dict: String, key: String, value):
	#masterDict.dict.key.value.update()
	pass



# there shouldn't be any reason to load a save, since the user can just relaunch for that, and there's nothing to backtrack in terms of saves, since everything syncs with the DM
func _pressed():
	Saver.save()
