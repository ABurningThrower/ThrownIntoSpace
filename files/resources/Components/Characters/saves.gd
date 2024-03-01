class_name CharacterSaves
extends Resource


enum Type {
	NONE,  ## No border.
	HALF,  ## Bronze border.
	FULL,  ## Silver border.
	DOUBLE ## Gold border.
}



@export var STR: Type = Type.NONE
@export var DEX: Type = Type.NONE
@export var CON: Type = Type.NONE
@export var INT: Type = Type.NONE
@export var WIS: Type = Type.NONE
@export var CHR: Type = Type.NONE
