extends TextureRect

@onready var musicPlayer:= $"Music Player"


func _ready() -> void:

#	var prefData = loadSaveData()
	musicPlayer.loadPref()
	
	$NetworkUI.show_connect()

func loadSaveData() -> Dictionary:
	var saveData:= Saver.load()
	return saveData 
