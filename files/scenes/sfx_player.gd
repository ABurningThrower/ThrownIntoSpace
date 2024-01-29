class_name SFX_Player
extends AudioStreamPlayer

# called by Host Listener
func _play(sfx: AudioStreamMP3) -> void:
	self.stream = sfx

