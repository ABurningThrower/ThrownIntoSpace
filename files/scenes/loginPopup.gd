extends Popup



func appear(_title: String) -> void:
	show()
	self.title = ""
#	var fadeTween:= get_tree().create_tween()
#	fadeTween.tween_property(self, "modulate:a", 1.0, 1.5).from(0.0).set_trans(Tween.TRANS_QUINT)
	
	if _title == "fullyEmpty":        # no user or pass
		$Message.text = "Did you seriously think you could log in without inputting anything?\n\nYou can't be fuckin serious..."
	elif _title == "emptyUser":       # no user
		$Message.text = "Seriously? Your username. How could you possibly forget your username, you fucking brainlet?\n\nThe monkeys I have to deal with..."
	elif _title == "emptyPassword":   # no pass
		$Message.text = "Are you that excited to log in that you forgot your password?\n\nUsing your room temperature IQ, if a serving of ketchup flowed more than 15cm in a minute, it would be illegal for consumer use.\n\n If only they didn't forget to lock up *all* the primates..."
	elif _title == "osMismatch":      # wrong os
		$Message.text = "You think I'm fucking stupid or something?\n\nMaybe those 1337 h4x0r skills of yours worked in elementary school, but you must have rockpox in your brain to think that would run with me."
	else:							  # badLogin
		$Message.text = "Please make sure you're spelling things right, moron."
