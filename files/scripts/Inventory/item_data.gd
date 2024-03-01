## Script for keeping track of item data based on resource.
class_name ItemData
extends Resource


enum Type {
	## Most item types; that which does not match any of the other types.
	MAIN,
	## A key item; non-discardable and generally non-consumable. Has it's own inventory section which does not take up inventory space.
	KEYITEM
}


## Type of Item.
@export var type: Type

## Name of Item.
@export var name: String

## Does the item lost a stack of itself when used?
@export var consumable: bool

## Description of Item.
@export_multiline var description: String

## Texture of Item.
@export var texture: CompressedTexture2D = get("res://files/system/Images/System/Image.png")

