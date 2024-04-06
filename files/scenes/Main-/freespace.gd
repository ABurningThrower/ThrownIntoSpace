extends TextureRect



func _ready():
	%SV.size = get_parent().size


#region Buttons
func _on_whiteboard_btn_toggled(toggled_on) -> void:
	if toggled_on == true:
		%SV.whiteboard_enabled = true
		$"HBox - Whiteboard".show()
		$"Whiteboard Vis Btn".show()
	else:
		%SV.whiteboard_enabled = false
		$"HBox - Whiteboard".hide()
		$"Whiteboard Vis Btn".hide()


func _on_whiteboard_vis_btn_toggled(toggled_on):
	if toggled_on == true:
		$"HBox - Whiteboard".hide()
		$"showBtns Arrow".hide()
			# send signal here for main to hide it's buttons, as well as music player?
		$"Whiteboard Vis Btn".text = "</>"
		updatable_statements = false
	else:
		$"HBox - Whiteboard".show()
		$"showBtns Arrow".show()
			# signal to show again?
		$"Whiteboard Vis Btn".text = "<0>"
		updatable_statements = true


func _on_notepad_btn_toggled(toggled_on) -> void:
	if toggled_on == true:
		$Notepad.show()
		$"Notepad/Tab Cont".get_child(currentTab).grab_focus()
		
	else:
		$Notepad.hide()


func _on_customs_btn_pressed() -> void:
	$"Dark Tint".show()
	DisplayServer.file_dialog_show("Open a file", "", "", false,DisplayServer.FILE_DIALOG_MODE_OPEN_FILES, ["*.png, *.jpeg, *.jpg, *.jfif, *.webp ; Images", "*.gif ; GIFs"], customs_dialog_finished)
	
#endregion

#region Btn Hover Area
var btn_area_open:= false

var updatable_statements:= true
@onready var X_statement: bool = int(get_global_mouse_position().x) in range(0, 160)
@onready var Y_statement: bool = int(get_global_mouse_position().y) in range(170, 550)


func _process(_delta) -> void:
	updateStatements()
	
	if X_statement && Y_statement && !$"Dark Tint".visible:
		if btn_area_open == false:
			$"HBox - Btns/Anim".play("flow_in")
			btn_area_open = true
	elif btn_area_open && !$"Dark Tint".visible:
		btn_area_open = false
		$"HBox - Btns/Anim".play("flow_out")



func updateStatements() -> void:
	if updatable_statements:
		X_statement = int(get_global_mouse_position().x) in range(0, 162)
		Y_statement = int(get_global_mouse_position().y) in range(170, 550)


func enlargeBtn(button: Button) -> void:
	pass  # tween that gradually but very quickly (~0.1s?) expands the button's size
	var fadeTween:= get_tree().create_tween()
	fadeTween.tween_property(button, "modulate:a", 1.0, 3).from(0.0).set_trans(Tween.TRANS_QUINT)

func ensmallBtn(button: Button) -> void:
	pass  # opposite of above
	var fadeTween:= get_tree().create_tween()
	fadeTween.tween_property(button, "modulate:a", 1.0, 3).from(0.0).set_trans(Tween.TRANS_QUINT)
#endregion

#region Whiteboard

'''
var whiteboard_enabled:= false
var bucketing:= false
var pressed:= false
var finished:= true 	# indicates if the line is finished and should end
var undoable:= true 	# indicates if ctrl+z is available
@onready var current_line: Line2D
@onready var pen_color: Color = %"Pen Color Btn".color
@onready var pen_size: float = 3.0
@onready var temp_color: Color = pen_color

const bg_color: Color = Color("090909")  # self.texture.colors[0]
'''

'''
func _input(event: InputEvent) -> void:
	if whiteboard_enabled && !bucketing: # pen + eraser tools
		pressed = (Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT)) or (event is InputEventScreenDrag)

		# start of new line
		if event is InputEventMouseButton && pressed && finished:
			%SV.cleanup_children()
			finished = false
			current_line = Line2D.new()
			current_line.default_color = pen_color
			current_line.width = pen_size
			current_line.begin_cap_mode = Line2D.LINE_CAP_ROUND
			current_line.end_cap_mode = Line2D.LINE_CAP_ROUND
			current_line.joint_mode = Line2D.LINE_JOINT_ROUND
			current_line.round_precision = 6
#			current_line.texture = get("res://files/system/Images/System/Circle.png")
			current_line.texture_repeat = CanvasItem.TEXTURE_REPEAT_ENABLED
			current_line.texture_mode = Line2D.LINE_TEXTURE_TILE
			
			current_line.add_point(get_global_mouse_position())
			%SV.add_child(current_line)
		
		# dragging
		elif pressed && !finished && (event is InputEventMouseMotion):
			current_line.add_point(event.position)
			%SV.update_texture()
		
		# undo
		elif !pressed && Input.is_action_pressed("Undo") && undoable:
			%SV.cleanup_children()
		elif !pressed && Input.is_action_just_released("Undo"):
			undoable = true
		
		else:
			finished = true
	
	elif whiteboard_enabled && bucketing: # bucket tool
		pass
'''

"""
func _on_pen_color_btn_color_changed(color) -> void:
	pen_color = color
	temp_color = color

	var new_sb = %"Pen Color Btn".get_theme_stylebox("normal")
	new_sb.bg_color = color


func _on_size_slider_drag_ended(value_changed) -> void:
	if value_changed:
		pen_size = %"Size Slider".value
		# update the slider's grabber size?



func _on_pen_btn_pressed() -> void:
	%"Pen Btn".button_pressed = true
	%"Eraser Btn".button_pressed = false
	%"Bucket Btn".button_pressed = false
	bucketing = false
	pen_color = temp_color


func _on_eraser_btn_pressed() -> void:
	%"Eraser Btn".button_pressed = true
	%"Pen Btn".button_pressed = false
	%"Bucket Btn".button_pressed = false
	bucketing = false
	if pen_color != bg_color:
		temp_color = pen_color
	pen_color = bg_color


func _on_bucket_btn_pressed() -> void:
	%"Bucket Btn".button_pressed = true
	%"Pen Btn".button_pressed = false
	%"Eraser Btn".button_pressed = false
	bucketing = true


func _on_clear_btn_pressed() -> void:
	current_line = $Lines/anticrash
	for child in $Lines.get_child_count():
		$Lines.get_child(child).queue_free()
"""
#endregion

#region Whiteboard Sub

#endregion

#region Notepad
@onready var currentTab: int = 0

func get_tab_node(tab_idx: int) -> Node:
	return $"Notepad/Tab Cont".get_child(tab_idx)


func _on_tab_container_tab_clicked(tab_idx: int) -> void:
	var lastTab: int = $"Notepad/Tab Cont".get_child_count()-1

	if tab_idx == lastTab:      	# "+"
		clear_LEPs()
		$"Notepad/Tab Cont".add_child(TextEdit.new())
		lastTab += 1
		var newTab: TextEdit = $"Notepad/Tab Cont".get_child(lastTab)
		newTab.name = ("Tab " + str(lastTab))
		$"Notepad/Tab Cont".move_child(%"+", lastTab)
#		%"+".release_focus()
		newTab.grab_focus()
#		newTab.show()
		get_tab_node(lastTab).hide()
	elif tab_idx == currentTab: 	# 
		clear_LEPs()
		var tab: TextEdit = get_tab_node(tab_idx)
		$Notepad.add_child(LEPopup.new())
		var LEP: LEPopup = $Notepad.get_child($Notepad.get_child_count()-1)
		LEP.connect("text_submitted", _on_LEP_text_submitted)
		LEP.connect("focus_exited", _on_LEP_focus_lost)
		LEP.text = tab.name
		LEP.select_all_on_focus = true
		LEP.grab_focus()
		print(LEP.focus_mode)
		while true:
			if LEP.focus_mode != 2:
				_on_LEP_focus_lost(LEP)
			else:
				var new_label: String = await LEP.text_submitted
				if new_label != "":
					tab.name = new_label
				break
		
		
		LEP.queue_free()
#		(await signal, doing tab.text = LEP.text on enter/click off [losing focus with edited text?], otherwise nothing?)

			  # if double-tapped/if clicked when active tab:
		pass  # allow user to change the tab (node) name, and maybe to set it's color? (is singular tab color setting even possible without making a custom tab cont?)
	
	get_tab_node(tab_idx).grab_focus()
	currentTab = tab_idx


func clear_LEPs() -> void:
	for child in $Notepad.get_children():
			if child is LEPopup:
				child.queue_free()

func _on_LEP_text_submitted(new_text: String) -> String:
	return new_text

func _on_LEP_focus_lost(_self: LEPopup) -> void:
	_self.queue_free()

## FOR DEBUGGING. REMOVE IF UNUSED.
func _on_plus_focus_entered() -> void:
	print("focus enter")
	%"+".release_focus()
	%"+".hide()

func _on_notepad_close_requested() -> void:
	$Notepad.hide()
#endregion

#region Customs
var offset:= Vector2(10,10)

func customs_dialog_finished(status: bool, paths: PackedStringArray, selected_filter_index: int) -> void:
	$"Dark Tint".hide()
#	print("Status: " + str(status) + "  Paths: " + str(paths) + "  Index: " + str(selected_filter_index))
	var file: Node
	
	if selected_filter_index == 0:  # images
		for path in paths:
			var cf:= CustomsFile.new()
			$Customs.add_child(cf)
			cf.makeImage(path)
			cf.position += offset
			offset += Vector2(15,15)


	if selected_filter_index == 1:  # gifs
		for path in paths:
			var gr = GifReader.new()
#			gr.read("res://files/system/Images/GIFs/kot.gif")
			
#			var image = Image.load_from_file(path)
#			var texture = ImageTexture.create_from_image(image)
			
			

	$Customs.add_child(file)
	
	# gifs might need special handling? if so, enum the index here


#endregion










func _on_enter_ui():
	pass # Replace with function body.
