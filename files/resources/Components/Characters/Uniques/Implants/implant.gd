class_name Implant
extends Resource


enum Type {
	FACIAL,
	FRONTAL_CORTEX,
	OCULAR,
	CIRCULATORY,
	RESPIRATORY,
	IMMUNE,
	NERVOUS,
	DIGESTIVE,
	INTEGUMENTARY,
	_OS,
	SKELETAL,
	HANDS,
	ARMS,
	LEGS
}


@export var name: String
@export var type: Type
@export var icon: Texture2D = get("res://files/system/Images/System/Image.png")
@export var effects: String  #effects.gd?

