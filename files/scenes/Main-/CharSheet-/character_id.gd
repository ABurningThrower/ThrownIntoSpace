extends TextureRect



func initData(btnData) -> void:
#	print("btnData at start of Char ID: " + str(btnData))
	var name: String
	if btnData.has("OWN_CHARACTER"):  # if char sheet is clicked
		name = Settings.getPlayer()
	else:
			name = 	btnData[0]
	var char: Resource = load("res://files/resources/Characters/Players/" + name + ".tres")
	setDetails(char)



func setDetails(char) -> void:
	$"Full HBox/Marginizer/Headshot".texture = char.pfp
	$"Info Panel Container/name".text = char.name
	$"Info Panel Container/class".text = char._class
