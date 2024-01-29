extends Popup


func appear(title: String) -> void:
	self.visible = true
	
	if title == "Seriously?":   # empty login
		$Message.text = "Did you seriously think you could log in without inputting anything? /n You can't be fuckin serious..."
	else:						# badLogin
		$Message.text = "Please make sure you're spelling things right, moron."


func disappear() -> void:
	self.visible = false

# title should change if empty login to "Seriously?"
