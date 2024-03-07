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


func _process(delta):
	##  Apply primary accent option feedback immediately when changed, but don't cause potential stutters/frame dropping otherwise.
	# while %"Apply Btn".disabled == false:
	#     $"Scrollifier/Panel Cont/Marginizer/~~~CONTENT~~~/Audio/Options/Music Volume/ProgressBar".bg_color = %"ColorPickerButton".color 
	#     $"Scrollifier/Panel Cont/Marginizer/~~~CONTENT~~~/Audio/Options/SFX Volume/ProgressBar".bg_color = %"ColorPickerButton".color 
	
	
	pass
	
