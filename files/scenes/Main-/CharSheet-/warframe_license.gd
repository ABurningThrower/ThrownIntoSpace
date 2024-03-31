extends TextureRect

#@onready var info_tree: Tree = $"Panel Cont/Marginizer/Back VBox/Tree"

signal item_selected()

'''
func _ready() -> void:
	var _root = info_tree.create_item()
	var main = info_tree.create_item()
	main.set_text(0, "Main")
	var sub = info_tree.create_item()
	sub.set_text(0, "Sub")
	var resistances = info_tree.create_item()
	resistances.set_text(0, "Resistances")
'''
	

func initData(btnData) -> void:
	
	var name = btnData[0]
	
	var char = load("res://files/resources/Characters/Players/" + name + ".tres")
	setDetails(char)

#region  Flips
func _on_flip_btn_pressed() -> void:
	toggleFlip()


func toggleFlip() -> void:
	if %"Front VBox".visible:
		%"Front VBox".hide()
		%"Back VBox".show()
	else: 
		%"Front VBox".show()
		%"Back VBox".hide()
	#SFX_Player._play("pageFlip")
#endregion




func setDetails(char) -> void:
	## Front
	$"Panel Cont/Marginizer/Front VBox/WF Name".text = char.name
	$"Panel Cont/Marginizer/Front VBox/WF Image".texture = char.fullbody
	
	## Back
	$"Panel Cont/Marginizer/Back VBox/WF Name".text = char.name
	$"Panel Cont/Marginizer/Back VBox/Header HBox/Pfp".texture = char.pfp
	
	
	




func on_item_selected() -> void:
	print("Clicked on column #")






	### On the topic of displaying info dynamically ###
	# either we could have a grid container with Labels in 2 columns, one for 
	# info name and the other for it's value, or we could try doing regex.
	# I think the latter would keep the code cleaner.
	
	# it may be better to switch the Info RTL to a scroll container and then
	# shove a whole bunch of nodes into there, though that could get messy.
	# maybe that's a sacrifice that must be made.





func _on_item_list_item_clicked(index, at_position, mouse_button_index) -> void:
	$"Panel Cont/Marginizer/Back VBox/Scrollifier/ItemList/VBoxContainer".add_child(RichTextLabel.new())
