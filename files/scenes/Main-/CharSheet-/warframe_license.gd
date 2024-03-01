extends TextureRect


func initData(btnData):
	
	var name = btnData[0]
	
	match name:
		"Ceros": 
			print("hi guys my name is Ceros")
		"Valk":
			pass
		"Kusuo":
			pass
		"Anuboid":
			pass






func _on_flip_btn_pressed():
	toggleFlip()


func toggleFlip():
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




	### On the topic of displaying info dynamically ###
	# either we could have a grid container with Labels in 2 columns, one for 
	# info name and the other for it's value, or we could try doing regex.
	# I think the latter would keep the code cleaner.
	
	# it may be better to switch the Info RTL to a scroll container and then
	# shove a whole bunch of nodes into there, though that could get messy.
	# maybe that's a sacrifice that must be made.
