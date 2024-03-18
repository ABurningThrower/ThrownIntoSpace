extends TextureRect


var btn_area_open: bool = false

var X_statement: bool = int(get_global_mouse_position().x) in range(0, 162)
var Y_statement: bool = int(get_global_mouse_position().y) in range(170, 550)

#region Buttons
func _on_whiteboard_btn_toggled(toggled_on) -> void:
	if toggled_on == true:
		pass
	else:
		pass


func _on_notepad_btn_toggled(toggled_on) -> void:
	if toggled_on == true:
		$Notepad.show()
	else:
		$Notepad.hide()


func _on_customs_btn_pressed() -> void:
	pass
#endregion


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



func _process(delta) -> void:
	updateStatements()
	
	if X_statement && Y_statement:
		if btn_area_open == false:
			$"Btn VBox/Anim".play("flow_in")
			btn_area_open = true
	elif btn_area_open:
		btn_area_open = false
		$"Btn VBox/Anim".play("flow_out")


func updateStatements() -> void:
	X_statement = int(get_global_mouse_position().x) in range(0, 162)
	Y_statement = int(get_global_mouse_position().y) in range(170, 550)
