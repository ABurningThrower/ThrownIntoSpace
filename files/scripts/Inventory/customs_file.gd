class_name CustomsFile
extends PanelContainer


func _ready() -> void:
	custom_minimum_size = Vector2(16,16)
	size = Vector2(100,100)

func makeImage(path: String) -> void:
	var tr:= TextureRect.new()
	add_child(tr)
	var image:= Image.load_from_file(path)
	var texture:= ImageTexture.create_from_image(image)
	
	tr.texture = texture
	tr.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	tr.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED


func makeGIF() -> void:
	pass
