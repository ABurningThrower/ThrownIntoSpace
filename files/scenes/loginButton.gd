extends Button




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

	elif username == "" && password == "":
		print('Empty Login')
		#emptyLogin()

	else:
		print('Bad Login')
		#badLogin()


func saveContinue(player) -> void:
	Saver.updateData("settingsDict", "player", player)
	get_tree().change_scene_to_file("res://files/scenes/main.tscn")


func emptyLogin():
	$"../../Popup".appear("Seriously?")

func badLogin():
	$"../../Popup".appear("Invalid Login.")
