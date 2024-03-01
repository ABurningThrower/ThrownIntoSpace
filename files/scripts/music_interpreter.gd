## Interprets name and tag from a song given a file path.
class_name MusicInterpreter
extends Node


static var untaggedSong = "res://files/system/Audio/Music/Untagged/Clair De Lune.mp3"
static var taggedSong = "res://files/system/Audio/Music/Tagged/[KZ] Psychology.mp3"
 


static func interpret(song: String) -> RegExMatch:
	var regexObj = RegEx.new()
	regexObj.compile(r"(\[[A-Z]+\])?([^/]+)(\.mp3)$")
	return regexObj.search(song)


static func getSong(song) -> Array:
	var songInfo = interpret(song)
	var tag = songInfo.get_string(1)
	var songName = songInfo.get_string(2)
	
	var stream = song
	
	
	return [tag, songName, stream]

