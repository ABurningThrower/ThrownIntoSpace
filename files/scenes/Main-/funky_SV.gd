extends SubViewport

var whiteboard_enabled:= false
var bucketing:= false
var pressed:= false
var finished:= true 	# indicates if the line is finished and should end
var undoable:= true 	# indicates if ctrl+z is available
@onready var current_line: Line2D
@onready var pen_color: Color = Color.WHITE
@onready var pen_size: float = 3.0
@onready var temp_color: Color = pen_color

const bg_color: Color = Color("090909")  # self.texture.colors[0]




func update_texture() -> void:
	var tex: Texture = get_texture()
	var img: Image = tex.get_image()
	get_child(0).texture = ImageTexture.create_from_image(img)


func cleanup_children() -> void:
	if get_child_count() > 1:
		get_child(-1).queue_free()


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
			
			current_line.add_point(event.position)
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


### These signals are to deter drawing into the Whiteboard Utilities while it's visible
func _on_enter_ui() -> void:
	finished = true

func _on_enter_ui_toggle(_toggled_on: bool) -> void:
	finished = true
