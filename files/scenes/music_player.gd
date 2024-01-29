extends TextureRect

@onready var fadeTween:= get_tree().create_tween()


func fadein():
	self.visible = true
	fadeTween.tween_property($".", "modulate:a", 1.0, 6).from(0.0).set_trans(Tween.TRANS_QUINT)

func fadeout():
		# probably just before the function that calls this, but there should be some linger time before fading
	fadeTween.tween_property($".", "modulate:a", 0.0, 3).from(1.0).set_trans(Tween.TRANS_QUINT)
	self.visible = false




# should listen to signal telling it to play music in order to fade in,
# otherwise it should remain invisible, or if user hid it.

