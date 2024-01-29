extends TextureRect

@onready var fadeTween:= get_tree().create_tween()
var volumePref: int = 100



func loadPref(prefs: Dictionary):
	volumePref = clamp(prefs.settingsDict.volume, 0, 100)
	if volumePref == 0:
		$Player.playing = false
	else:
		$Player.volume_db = (volumePref/4.0) - 20


func fadein():
	self.visible = true
	fadeTween.tween_property($".", "modulate:a", 1.0, 6).from(0.0).set_trans(Tween.TRANS_QUINT)

func fadeout():
		# probably just before the function that calls this, but there should be some linger time before fading
	fadeTween.tween_property($".", "modulate:a", 0.0, 3).from(1.0).set_trans(Tween.TRANS_QUINT)
	self.visible = false


func play(song: AudioStreamMP3):
	$Player.stream = song
	pass


# should listen to signal telling it to play music in order to fade in,
# otherwise it should remain invisible, or if user hid it.

