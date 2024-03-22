extends TextureRect


var btn_area_open: bool = false

@onready var X_statement: bool = int(get_global_mouse_position().x) in range(0, 162)
@onready var Y_statement: bool = int(get_global_mouse_position().y) in range(170, 550)


var whiteboard_enabled:= false
var pressed:= false
var current_line: Line2D
@export var selected_color: Color
@onready var pen_color: Color = %"Pen Color Btn".color


func _process(_delta) -> void:
	updateStatements()
	
	if X_statement && Y_statement:
		if btn_area_open == false:
			$"HBox - Btns/Anim".play("flow_in")
			btn_area_open = true
	elif btn_area_open:
		btn_area_open = false
		$"HBox - Btns/Anim".play("flow_out")


#region Whiteboard
func _input(event: InputEvent) -> void:
	if whiteboard_enabled:
		pressed = (Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT)) or (event is InputEventScreenDrag)

		
		if event is InputEventMouseButton && Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			current_line = Line2D.new()
			current_line.default_color = pen_color
			current_line.width = 3.0
			current_line.add_point(get_global_mouse_position())
			$Lines.add_child(current_line)
		
		if pressed && (event is InputEventMouseMotion):
			current_line.add_point(event.position)


func _on_pen_color_btn_color_changed(color):
	pen_color = color
	
	var new_sb = %"Pen Color Btn".get_theme_stylebox("normal").duplicate()
	new_sb.bg_color = color
	%"Pen Color Btn".add_theme_stylebox_override("normal", new_sb)
	%"Pen Color Btn".add_theme_stylebox_override("hover", new_sb)
	%"Pen Color Btn".add_theme_stylebox_override("pressed", new_sb)


## These signals are to avoid drawing into the Whiteboard Utilities while it's visible
func _on_whiteboard_hbox_mouse_entered():
	whiteboard_enabled = false
func _on_whiteboard_hbox_mouse_exited():
	whiteboard_enabled = true

func _on_pen_color_btn_mouse_entered():
	whiteboard_enabled = false
func _on_pen_color_btn_mouse_exited():
	whiteboard_enabled = true
#endregion

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
		$"Whiteboard Vis Btn".text = "</>"
	else:
		$"HBox - Whiteboard".show()
		$"Whiteboard Vis Btn".text = "<0>"


func _on_notepad_btn_toggled(toggled_on) -> void:
	if toggled_on == true:
		$Notepad.show()
	else:
		$Notepad.hide()


func _on_customs_btn_pressed() -> void:
	$"Dark Tint".show()
	var test = DisplayServer.file_dialog_show("Open a file", "", "", false,DisplayServer.FILE_DIALOG_MODE_OPEN_FILES, [], _on_notepad_btn_toggled)

#endregion

#region Notepad
func _on_tab_container_tab_clicked(tab) -> void:
	var lastTab: int = $"Notepad/Tab Cont".get_child_count()-1
	
	if tab == lastTab:
		$"Notepad/Tab Cont".add_child(TextEdit.new())
		lastTab += 1
		var newTab: Node = $"Notepad/Tab Cont".get_child(lastTab)
		newTab.name = "Tab " + str(lastTab)
		$"Notepad/Tab Cont".move_child(%"+", lastTab)
	else:
		# if double-tapped/if clicked when active tab:
		pass  # allow user to change the tab (node) name, and maybe to set it's color? (is singular tab color setting even possible without making a custom tab cont?)


func _on_notepad_close_requested() -> void:
	$Notepad.hide()
#endregion

#region Btn Hover Area
func updateStatements() -> void:
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


#region Customs

#endregion











