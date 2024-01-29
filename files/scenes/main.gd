extends TextureRect


func _ready() -> void:
	# initialize default scene based on settings
	Saver.save()
	
	var prefData = loadSaveData()
	$"Music Player".loadPref(prefData)

func loadSaveData() -> Dictionary:
	var saveData:= Saver.load()
	return saveData 
