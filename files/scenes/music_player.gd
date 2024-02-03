extends Control

@onready var fadeTween:= get_tree().create_tween()
var volumePref: int = 100

func _ready():
	%"Appear Btn".pressed.connect(appear.bind())
	%"Hide Btn".pressed.connect(disappear.bind())
	%"Play\\Pause Btn".pressed.connect(play.bind())


func _process(__) -> void:
	%Player.volume_db = (%"Volume Control".value/4.0) - 20

func loadPref(prefs: Dictionary):
	volumePref = clamp(prefs.settingsDict.volume, 0, 100)
	if volumePref == 0:
		%Player.playing = false
	else:
		%Player.volume_db = (volumePref/4.0) - 20


func fadein():
	$BG.visible = true
	fadeTween.tween_property(self, "modulate:a", 1.0, 3).from(0.0).set_trans(Tween.TRANS_QUINT)

func fadeout():
		# probably just before the function that calls this, but there should be some linger time before fading
	fadeTween.tween_property(self, "modulate:a", 0.0, 3).from(1.0).set_trans(Tween.TRANS_QUINT)
	$BG.visible = false


func appear():
	%"Appear Btn".visible = false
	$BG.visible = true
	

func disappear():
	$BG.visible = false
	%"Appear Btn".visible = true


func pause():
	%Player.playing = false
	%"Play\\Pause Btn".icon = "res://files/system/Images/System/pause.png"
	
func resume():
	# acquire current song and duration from Host Listener
	%Player.playing = true
	%"Play\\Pause Btn".icon = "res://files/system/Images/System/play.png"


func play(song: AudioStreamMP3):
	$BG/Player.stream = song





func instantiateButtons(node) -> void:
	%"Hide Btn".pressed


func get_buttons(node) -> Array:
	var buttons:= []
	for child in node.get_children():
		if child is TransitionButton:
			buttons.append(child)
		buttons.append_array(get_buttons(child))

	return buttons




# should listen to signal telling it to play music in order to fade in,
# otherwise it should remain invisible, or if user hid it.
