extends Button

@onready var logins = {
	"Karma" : {"password": "IFuckingLoveAlcohol!!", "os": "Linux"},
	"sol.halych" : {"password": "KillAllRobots924!", "os": "Windows"},
	"m.balls" : {"password": "griddyfortnite", "os": "Windows"},
	"J": {"password": $"../Bottom Text".text, "os": "Linux"}
}


func _pressed() -> void:	
	var username: String = %"Username Input".text
	var password: String = %"Password Input".text
	var os: String = OS.get_name()
	
	
	if username == "Karma" && password == logins["Karma"]["password"] && os == logins["Karma"]["os"]:
		print('Karma Login')
		saveContinue("Karma")

	elif username == "sol.halych" && password == logins["sol.halych"]["password"] && os == logins["sol.halych"]["os"]:
		print('Sol Login')
		saveContinue("Sol")

	elif username == "m.balls" && password == logins["m.balls"]["password"] && os == logins["m.balls"]["os"]:
		print('Maxim Login')
		saveContinue("Maxim")

	elif username == "J" && password == logins["J"]["password"] && os == logins["J"]["os"]:
		print('Login successful. Welcome back, Overseer.')
		saveContinue("J")

	elif username == "" && password == "":
		loginPopup("fullyEmpty")

	elif username == "":
		loginPopup("emptyUser")

	elif password == "":
		loginPopup("emptyPassword")

#	elif OS.get_name() != :
#		loginPopup("osMismatch")

	else:
		loginPopup("bad")


func saveContinue(player) -> void:
	# Setting the login keys for a bit of extra security (not the professional way to do this, but in this application more is not necessary)
	match player:
		"Karma":
			Saver.updateData("userDict", "login_key", "k:ASOSDJK089k243iomp*(SJ*Djj*$H(!&hd0834h084))")
		"Sol":
			Saver.updateData("userDict", "login_key", "H&(o*dg(fbn4!~*{jD#~_CRRK(K$]J!@)!H#+:_TG#$*22!H}))")
		"Maxim":
			Saver.updateData("userDict", "login_key", "()K_+~~:L)OL@#D{!}FIK)K@_JF@OJ^&*(!#$NZXCOHE$O@!URF")

	Saver.updateData("userDict", "player", player)
	if player == "J":
		Saver.updateData("userDict", "login_key", "#null")
		get_tree().change_scene_to_file("res://files/scenes/dm_screen.tscn")
	else:
		get_tree().change_scene_to_file("res://files/scenes/main.tscn")
	
	
	



func loginPopup(message) -> void:
	$"../../Popup".appear(message)
