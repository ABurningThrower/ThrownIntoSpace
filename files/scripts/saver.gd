## Manages save file.
class_name Saver

static var savePath : String = "user://save.tres"


static func save() -> void:
	var writer = FileAccess.open(savePath, FileAccess.WRITE)
	var json_string = JSON.stringify(Settings.masterDict)

	# Store the save dictionary as a new line in the save file.
	writer.store_line(json_string)
	


static func load() -> Dictionary:
	# check if savefile exists
	if not FileAccess.file_exists(savePath):
		return {} # Error! We don't have a save to load.
	
	# if it does 
	var reader = FileAccess.open(savePath, FileAccess.READ)
	var json_string = reader.get_line()
	var json = JSON.new()

	# Check if there is any error while parsing the JSON string, skip in case of failure
	var parse_result = json.parse(json_string)
	if parse_result != OK:
		print("JSON Parse Error: ", json.get_error_message(), " in ", json_string, " at line ", json.get_error_line())
		return {}
	
	
	return json.data


static func updateData(dict: String, key: String, value) -> void:
	Settings.masterDict[dict][key] = value
	save()
#	print(masterDict[dict][key])


static func hasData() -> bool:
	if FileAccess.file_exists(savePath):
		return true
	else:
		return false



static func setToDefault() -> void:
	Settings.masterDict = Settings.defaultDict.duplicate(true)
