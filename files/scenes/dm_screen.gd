extends Control

func _ready() -> void:
	$"BG/Panels/Network Panel/Host Btn".show_host()






#region  Button Bindings

func _on_toggle_vis_btn_pressed():
	pass # Replace with function body.



func _on_network_btn_pressed() -> void:
	$"BG/Buttons/Network Btn".visible = false
	$"BG/Panels/Network Panel".visible = true


func _on_net_close_btn_pressed() -> void:
	$"BG/Panels/Network Panel".visible = false
	$"BG/Buttons/Network Btn".visible = true



func _on_music_btn_pressed() -> void:
	$"BG/Panels/Music Panel".visible = true
	$BG/Buttons.visible = false
	$"ToggleVis Btn".visible = false


func _on_mus_close_btn_pressed() -> void:
	$"BG/Panels/Music Panel".visible = false
	$BG/Buttons.visible = true
	$"ToggleVis Btn".visible = true


func _on_to_scene_btn_pressed() -> void:
	pass # Replace with function body.


func _on_combat_btn_pressed() -> void:
	pass # Replace with function body.


func _on_di_btn_pressed() -> void:
	pass # Replace with function body.



func _on_load_module_btn_pressed() -> void:
	pass # Replace with function body.



func _on_image_import_btn_pressed() -> void:
	pass # Replace with function body.



func _on_viewport_btn_pressed() -> void:
	$"BG/Panels/Viewport Panel".visible = true
	$BG/Buttons.visible = false



#endregion




#region  Panel Logic

	#Viewport
	### the idea here is that the grid container gets filled with the viewports of the players, based on how many there are, similar to discord's vc panels. Further similarly, on click of the viewport, the screen should "maximize" into the viewport, and there should be an indicator somewhere showing who's viewport it is/when you move the mouse this info should be briefly displayed.


	#Music
	### on click, should bring up a "custom file open dialog", for the purposes of being able to preview what a song sounds like before commiting it to the player-side.

## music panel: start playing audio from %"Music Preview" (pausing playing audio client-side when doing so; maybe fetch length metadata and use a hScroller to show length through the track? Volume slider?)

#endregion




#region  Misc



#endregion










