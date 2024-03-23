extends TextureRect

var bg_color: Color = Color("090909")


#region Buttons
func _on_whiteboard_btn_toggled(toggled_on) -> void:
	if toggled_on == true:
		whiteboard_enabled = true
		$"HBox - Whiteboard".show()
		$"Whiteboard Vis Btn".show()
	else:
		whiteboard_enabled = false
		$"HBox - Whiteboard".hide()
		$"Whiteboard Vis Btn".hide()


func _on_whiteboard_vis_btn_toggled(toggled_on):
	if toggled_on == true:
		$"HBox - Whiteboard".hide()
		$"showBtns Arrow".hide()
			# send signal here for main to hide it's buttons?
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
	else:
		$Notepad.hide()


func _on_customs_btn_pressed() -> void:
	$"Dark Tint".show()
	var test = DisplayServer.file_dialog_show("Open a file", "", "", false,DisplayServer.FILE_DIALOG_MODE_OPEN_FILES, [], _on_notepad_btn_toggled)

#endregion

#region Btn Hover Area
var btn_area_open:= false

var updatable_statements:= true
@onready var X_statement: bool = int(get_global_mouse_position().x) in range(0, 162)
@onready var Y_statement: bool = int(get_global_mouse_position().y) in range(170, 550)


func _process(_delta) -> void:
	updateStatements()
	
	if X_statement && Y_statement:
		if btn_area_open == false:
			$"HBox - Btns/Anim".play("flow_in")
			btn_area_open = true
	elif btn_area_open:
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
var whiteboard_enabled:= false
var bucketing:= false
var pressed:= false
@onready var current_line: Line2D = $Lines/anticrash
@onready var pen_color: Color = %"Pen Color Btn".color
@onready var pen_size: float = 3.0
@onready var temp_color: Color = pen_color



func _input(event: InputEvent) -> void:
	if whiteboard_enabled && !bucketing:
		pressed = (Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT)) or (event is InputEventScreenDrag)

		if event is InputEventMouseButton && Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			current_line = Line2D.new()
			current_line.default_color = pen_color
			current_line.width = pen_size
			current_line.begin_cap_mode = Line2D.LINE_CAP_ROUND
			current_line.end_cap_mode = Line2D.LINE_CAP_ROUND
			current_line.joint_mode = Line2D.LINE_JOINT_BEVEL
			current_line.round_precision = 6
			current_line.texture = get("res://files/system/Images/System/Circle.png")
			current_line.texture_mode = Line2D.LINE_TEXTURE_TILE
			
			current_line.add_point(get_global_mouse_position())
			$Lines.add_child(current_line)
		
		if pressed && (event is InputEventMouseMotion):
			current_line.add_point(event.position)
	
	elif whiteboard_enabled && bucketing:
		pass


func _on_pen_color_btn_color_changed(color):
	pen_color = color
	temp_color = color
#	%"Pen Btn".button_pressed = true

	var new_sb = %"Pen Color Btn".get_theme_stylebox("normal")
	new_sb.bg_color = color


func _on_size_slider_drag_ended(value_changed):
	if value_changed:
		pen_size = %"Size Slider".value
		# update the slider's grabber size?



func _on_pen_btn_pressed():
	%"Eraser Btn".button_pressed = false
	%"Bucket Btn".button_pressed = false
	bucketing = false
	pen_color = temp_color


func _on_eraser_btn_pressed():
	%"Pen Btn".button_pressed = false
	%"Bucket Btn".button_pressed = false
	bucketing = false
	temp_color = pen_color
	pen_color = bg_color


func _on_bucket_btn_pressed():
	%"Pen Btn".button_pressed = false
	%"Eraser Btn".button_pressed = false
	bucketing = true


func _on_clear_btn_pressed():
	current_line = $Lines/anticrash
	for child in $Lines.get_child_count():
		if $Lines.get_child(child).name != "anticrash":
			$Lines.get_child(child).queue_free()

#endregion

#region Whiteboard Sub
### These signals are to deter drawing into the Whiteboard Utilities while it's visible
func _on_whiteboard_hbox_mouse_entered():
	whiteboard_enabled = false
func _on_whiteboard_hbox_mouse_exited():
	whiteboard_enabled = true

func _on_pen_color_btn_mouse_entered():
	whiteboard_enabled = false
func _on_pen_color_btn_mouse_exited():
	whiteboard_enabled = true

func _on_border_mouse_entered():
	whiteboard_enabled = false
func _on_border_mouse_exited():
	whiteboard_enabled = true

func _on_size_slider_mouse_entered():
	whiteboard_enabled = false
func _on_size_slider_mouse_exited():
	whiteboard_enabled = true

func _on_whiteboard_vis_btn_mouse_entered():
	whiteboard_enabled = false
func _on_whiteboard_vis_btn_mouse_exited():
	whiteboard_enabled = true
#endregion

#region Notepad
@onready var currentTab: TextEdit = $"Notepad/Tab Cont/Tab 1"
@onready var renamePopup: PackedScene = preload("res://files/scenes/line_edit_popup.tscn")

func _on_tab_container_tab_clicked(tab) -> void:
	var lastTab: int = $"Notepad/Tab Cont".get_child_count()-1
	
	if tab == lastTab:
		$"Notepad/Tab Cont".add_child(TextEdit.new())
		lastTab += 1
		var newTab: TextEdit = $"Notepad/Tab Cont".get_child(lastTab) as TextEdit
		newTab.name = "Tab " + str(lastTab)
		$"Notepad/Tab Cont".move_child(%"+", lastTab)
		newTab.grab_focus()
	elif tab == currentTab:
#		var rP = tab.add_child(renamePopup.new())	# ?
#		rP.text = tab.text
#		(await signal, doing tab.text = rP.text on enter/click off [losing focus with edited text?], otherwise nothing?)

			  # if double-tapped/if clicked when active tab:
		pass  # allow user to change the tab (node) name, and maybe to set it's color? (is singular tab color setting even possible without making a custom tab cont?)


func _on_tab_cont_tab_selected(tab):
	currentTab = tab


func _on_notepad_close_requested() -> void:
	$Notepad.hide()
#endregion

#region Customs

#endregion


