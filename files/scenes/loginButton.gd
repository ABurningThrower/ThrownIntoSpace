extends Button


func _ready():
	$"../Bottom Text".queue_free()

func _pressed() -> void:	
	var username: String = %"Username Input".text
	var password: String = %"Password Input".text
	var os: String = OS.get_name()
	
	
	if username == "Karma" && password == "IFuckingLoveAlcohol!!" && os == "Linux":
		print('Karma Login')
		saveContinue("Karma")

	elif username == "sol.halych" && password == "KillAllRobots924!" && os == "Windows":
		print('Sol Login')
		saveContinue("Sol")

	elif username == "m.balls" && password == "griddyfortnite" && os == "Windows":
		print('Maxim Login')
		saveContinue("Maxim")

	elif username == "J" && password == $"../Bottom Text".text && os == "Linux":
		print('Login successful. Welcome back, Overseer.')
		saveContinue("J")

	elif username == "" && password == "":
		loginPopup("fullyEmpty")

	elif username == "":
		loginPopup("emptyUser")

	elif password == "":
		loginPopup("emptyPassword")

	else:
		loginPopup("bad")


func saveContinue(player) -> void:
	Saver.updateData("userDict", "player", player)
	if player == "J":
		get_tree().change_scene_to_file("res://files/scenes/dm_screen.tscn")
	else:
		get_tree().change_scene_to_file("res://files/scenes/main.tscn")


func loginPopup(message) -> void:
	$"../../Popup".appear(message)
