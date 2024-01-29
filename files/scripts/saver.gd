class_name Saver
extends Resource

#const savePath := preload("user://save.tres")



func save() -> void:
#	ResourceSaver.save(savePath, self)
	pass

static func load() -> Resource:
	
	# May be fixed in Godot 4
#	if not ResourceLoader.has_cached(savePath):
#		return ResourceLoader.load(savePath, "", true)

#	var file := File.new()   # ???
	return null




func _pressed():
	save()
