extends TextureRect

var saveDict: Dictionary = Settings.masterDict["settingsDict"]
var dataToSave: Array = []



func _ready() -> void:
	updateToSettings()

func updateToSettings() -> void:
	pass # i.e. volume slider value should reflect value in settings




func _on_apply_button_pressed() -> void:
	
	### IDEAS:
	# on_property_list_changed():
	#	 %"Apply Btn".disabled == false
	
	
	
#	for key, value in {}:
#		Saver.updateData("settingsDict", key, value)

	pass


func _on_color_picker_button_color_changed(color) -> void:
	print("Color has been changed to: " + str(color))
	%"ColorPickerButton".color = color  # this needs to change the color of the stylebox instead
	%"Apply Btn".disabled = false


func _process(_delta) -> void:
	##  Apply primary accent option feedback immediately when changed, but don't cause potential stutters/frame dropping otherwise.
	# while %"Apply Btn".disabled == false:
	#     $"Scrollifier/Panel Cont/Marginizer/~~~CONTENT~~~/Audio/Options/Music Volume/ProgressBar".bg_color = %"ColorPickerButton".color 
	#     $"Scrollifier/Panel Cont/Marginizer/~~~CONTENT~~~/Audio/Options/SFX Volume/ProgressBar".bg_color = %"ColorPickerButton".color 
	
	
	pass
	
