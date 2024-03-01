extends PanelContainer


func toggle():
	if self.visible == false:
		$"Sidebar Anim".play("open")
		$"VBox Btn Container/Elements Anim".play("slide_in")	# this animation should simultaneously fade in the text (modulate:a) and move the position from some point to where it needs to be.
		self.visible = true
	else:
		$"VBox Btn Container/Elements Anim".play("slide_out")
		$"Sidebar Anim".play("close")
		self.visible = false


func _on_sidebar_btn_pressed():
	toggle()
