extends TextureRect



func initData(btnData) -> void:
	
	var name = btnData[0]
	
	var char = load("res://files/resources/Characters/Players/" + name + ".tres")
	setDetails(char)

#region  Flips
func _on_flip_btn_pressed() -> void:
	toggleFlip()


func toggleFlip() -> void:
	# flip to back
	if %"Front VBox".visible == true:
		%"Front VBox".visible = false
		%"Back VBox".visible = true
		#SFX_Player._play("pageFlip")

	# flip to front
	else: 
		%"Front VBox".visible = true
		%"Back VBox".visible = false
		#SFX_Player._play("pageFlip")
#endregion




func setDetails(char) -> void:
	## Front
	$"Panel Cont/Marginizer/Front VBox/WF Name".text = char.name
	$"Panel Cont/Marginizer/Front VBox/WF Image".texture = char.fullbody
	
	## Back
	$"Panel Cont/Marginizer/Back VBox/WF Name".text = char.name
	$"Panel Cont/Marginizer/Back VBox/Header HBox/Pfp".texture = char.pfp
	
	
	









	### On the topic of displaying info dynamically ###
	# either we could have a grid container with Labels in 2 columns, one for 
	# info name and the other for it's value, or we could try doing regex.
	# I think the latter would keep the code cleaner.
	
	# it may be better to switch the Info RTL to a scroll container and then
	# shove a whole bunch of nodes into there, though that could get messy.
	# maybe that's a sacrifice that must be made.
