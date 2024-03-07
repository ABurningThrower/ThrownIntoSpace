extends TextureRect



func initData(btnData) -> void:
	var name: String
	if btnData == ["TRANSITION_OVERRIDE"]:
		name = Settings.masterDict.userDict["player"]
	else:
		name = btnData[0]
	var char: Resource = load("res://files/resources/Characters/Players/" + name + ".tres")
	setDetails(char)



func setDetails(char) -> void:
	$"Full HBox/Marginizer/Headshot".texture = char.pfp
	$"Info Panel Container/name".text = char.name
	$"Info Panel Container/class".text = char._class
