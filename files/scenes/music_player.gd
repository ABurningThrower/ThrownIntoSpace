extends Control

@onready var volumePref: int = clamp(Settings.masterDict["settingsDict"]["volume"], 0, 100)

var playButton = load("res://files/system/Images/System/play.png")
var pauseButton = load("res://files/system/Images/System/pause.png")


func _ready() -> void:
	%"Appear Btn".pressed.connect(appear.bind())
	%"Hide Btn".pressed.connect(disappear.bind())
	%"Play\\Pause Btn".pressed.connect(pauseResume.bind())

	%"Volume Control".value = volumePref


func _process(__) -> void:
	%Player.volume_db = (%"Volume Control".value/4.0) - 25
	

func loadPref() -> void:
	if volumePref == 0:
		%Player.playing = false
	else:
		%Player.volume_db = (volumePref/4.0) - 25


func fadein() -> void:
	$BG.visible = true
	var fadeTween:= get_tree().create_tween()
	fadeTween.tween_property(self, "modulate:a", 1.0, 3).from(0.0).set_trans(Tween.TRANS_QUINT)

func fadeout() -> void:
		# probably just before the function that calls this, but there should be some linger time before fading
	var fadeTween:= get_tree().create_tween()
	fadeTween.tween_property(self, "modulate:a", 0.0, 3).from(1.0).set_trans(Tween.TRANS_QUINT)
	$BG.visible = false


func appear() -> void:
	%"Appear Btn".visible = false
	$BG.visible = true
	

func disappear() -> void:
	$BG.visible = false
	%"Appear Btn".visible = true


func pauseResume() -> void:

	if %"Play\\Pause Btn".icon == playButton:
		%Player.playing = false
		%"Play\\Pause Btn".icon = pauseButton
	else:
		%Player.playing = true
		%"Play\\Pause Btn".icon = playButton


func play(path: String = "") -> void:
	var song = MusicInterpreter.getSong(path)
	$BG/Player.stream = load(path)
	$BG/Title.text = song[1]
	$BG/Subtitle.text = song[0]

	%Player.playing = true

# should listen to signal telling it to play music in order to fade in,
# otherwise it should remain invisible, or if user hid it.





func _on_bg_focus_entered() -> void:
	pass # Replace with function body.



func _on_bg_focus_exited() -> void:
	pass # Replace with function body.
