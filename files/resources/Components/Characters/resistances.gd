class_name CharacterResistances
extends Resource


### Most damage resistances past T2 stay at 1.0 unless explicitly weak or resistant

@export_category("Physical")
@export var Slash: float = 1
@export var Pierce: float = 1
@export var Blunt: float = 1


@export_category("T1")
@export var Heat: float = 1
@export var Cold: float = 1
@export var Electricity: float = 1
@export var Toxin: float = 1


@export_category("T2")
@export var Plasma: float = 1
@export var Radio: float = 1
@export var Acid: float = 1
@export var Gas: float = 1
@export var Spores: float = 1
@export var Fossil: float = 1
@export var Prawnacus: float = 1


@export_category("T3")
@export var Explosive: float = 1
@export var Corrosive: float = 1
@export var Light: float = 1
@export var Shadow: float = 1
@export var Warding: float = 1
@export var Infection: float = 1
@export var Freeze: float = 1


@export_category("T4")
@export var Radioactive: float = 1
@export var Nox: float = 1
@export var Frostburn: float = 1
@export var Infestation: float = 1
@export var Psychic: float = 1
@export var Life: float = 1
@export var Leech: float = 1


@export_category("T5")
@export var Decay: float = 1
@export var Antimatter: float = 1
@export var Void: float = 1
@export var Nuclear: float = 1
@export var Hivemind: float = 1
