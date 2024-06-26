# Derived from https://github.com/jegor377/godot-gdgifexporter

@tool
extends EditorImportPlugin

func _get_importer_name():
	return "gif.animated.texture.plugin"

func _get_visible_name():
	return "Animated Texture"

func _get_recognized_extensions():
	return ["gif"]

func _get_save_extension():
	return "tres"

func _get_resource_type():
	return "AnimatedTexture"

func _get_preset_count():
	return 1

func _get_preset_name(i):
	return "Default"

func _get_import_options(_str, _i) -> Array[Dictionary]:
	return [
		{"name": "Filter", "default_value": false},
		{"name": "MipMaps", "default_value": false}
	]

func import(source_file, save_path, options, platform_variants, gen_files):
	var reader = GifReader.new()
	reader.filter = options["Filter"]
	reader.mipmaps = options["MipMaps"]
	var tex = reader.read(source_file)
	if tex == null:
		return FAILED
	var filename = save_path + "." + _get_save_extension()
	return ResourceSaver.save(filename, tex)
