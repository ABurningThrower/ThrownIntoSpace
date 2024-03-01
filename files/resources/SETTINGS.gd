## Keeps track of dictionaries containing data to be used by the app and saved in save.tres.
class_name Settings
extends Node


static var masterDict:= {}



static var defaultDict:= {
	userDict = {
		"player": null,
		"login_key": null
	},
	settingsDict = {
		"volume": 60,
		"sfx_volume": 0,
		"default_scene": "res://files/scenes/Main-/crew.tscn"
	},
	charInventoryDict  = [
		"res://files/resources/Items/character_id.tres"	    	# Maxim should have a custom ID item
	],
	shipInventoryDict = [
		"res://files/resources/Items/wf_license.tres"
	]
}
