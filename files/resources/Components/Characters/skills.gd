class_name CharacterSkills
extends Resource


enum Attacks {
	PUNCH,
	MANTIS_BLADE_SLASH,
	MANTIS_BLADE_PIERCE,
	PARIS,
}


enum Nondamage {
	SUTURIZE,		 # add pointers to skills?
	PINE_RESIN,
}


enum Misc {
	MOVE,
	DEFEND,
	TAKE_NOTE,
	COUNTER,
	OPPORTUNITY_ATTACK,
}


@export var attacks: Array[Attacks] 	= [Attacks.PUNCH]
@export var nondamage: Array[Nondamage] = []
@export var misc: Array[Misc] 			= [Misc.MOVE, Misc.DEFEND, Misc.TAKE_NOTE, Misc.COUNTER, Misc.OPPORTUNITY_ATTACK]


