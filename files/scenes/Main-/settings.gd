extends TextureRect

var saveDict: Dictionary = Settings.masterDict["settingsDict"]
var dataToSave: Array = []



func _ready():
	updateToSettings()

func updateToSettings():
	pass # i.e. volume slider value should reflect value in settings




func _on_apply_button_pressed():
	
	### IDEAS:
	# on property_list_changed() tell apply button to enable clickability
	
	
	
#	for key, value in {}:
#		Saver.updateData("settingsDict", key, value)

	pass


func _on_color_picker_button_color_changed(color):
	%"ColorPickerButton".color = color
