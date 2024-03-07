## Script for keeping track of enemy data based on resource.
class_name CharData
extends Resource


enum Type {
	MAIN,	##.
	MINIBOSS,	##.
	BOSS	##.
}

enum Faction {
	ALLY,	##.
	NEUTRAL,	##.
	ENEMY	##.
}

enum Race {
	HUMAN,
	GHOSTRUNNER,
	VI_NYA,
	NINAH,
	MIKEA,
	WARFRAME,
	GRINEER,
	CORPUS,
	INFESTED,
	TRON,
	PRAWNACUS,
	BEASTKIN,
	OTHER,
	UNKNOWN 	## Shows up as ??? in-game.
}

enum Alignment {
	LAWFUL_GOOD,
	LAWFUL_NEUTRAL,
	LAWFUL_EVIL,
	NEUTRAL_GOOD,
	TRUE_NEUTRAL,
	NEUTRAL_EVIL,
	CHAOTIC_GOOD,
	CHAOTIC_NEUTRAL,
	CHAOTIC_EVIL,
}


enum Languages {
	HUMAN,
	VI_NYA,
	NINAH,
	GRINEER,
	CORPUS,
	INFESTED,
	I,
	BOA,
	JAVA,
	I_,
	TRON,
	PRAWNACUS,
	BEASTKIN,
	OTHER,
	UNKNOWN 	## Shows up as ??? in-game.
}



@export_category("Profile")
## Character's relationship to the players.
@export var faction: Faction = Faction.NEUTRAL

## Type of character (only applies to enemies/neutrals).
@export var type: Type = Type.MAIN

## Character name.
@export var name: String = "John Fillerson"

## Character pfp/icon.
@export var pfp: Texture2D = get("uid://c6ugb2pcpbgp:")

## Full picture of the character.
@export var fullbody: Texture2D = get("uid://c6ugb2pcpbgp:")


@export_category("Main")
## Character level.
@export var level: int = 5

## Character class.
@warning_ignore("unused_private_class_variable")
@export var _class: String    # use class.tres

## Character subclass.
@export var subclass: String  # see above

## Character race.
@export var race: Race = Race.UNKNOWN



## Character HP.
@export var hp : int = 10

## Character max HP.
@export var max_hp : int = 10


## Character SHP.
@export var shp : int = 4

## Character max SHP.
@export var max_shp : int = 4



## Character AC.
@export var ac : int = 10


@export_category("Sub")
## Character speed.
@export var speed : int = 30

## Character initiative.
@export var initiative : int = 0

## Character hit die.
@export var hit_die : String = "d8"

## Character prof bonus.
@export var prof_bonus : int = 3

## Character alignment.
@export var alignment : Alignment = Alignment.TRUE_NEUTRAL

## Character's background.
@export var background: String = "???"  	# resource?

## Languages the character knows.
@export var languages : Array[Languages]




@export_category("Big Data")
## Character's saving throws.
@export var saving_throws : CharacterSaves


## Character stats.
@export var stats: CharacterStats

## Character proficiencies.
@export var profs: CharacterProfs


## Character's resistances.
@export var resistances: CharacterResistances


## Active skills the character can use (in combat).
@export var skills: CharacterSkills


## Unique Character Data
@export var misc_data: Array





## Returns an Array[String] with imbuement data, in the following order:
## [Tier, Notation, Formula]
#func _get(Character: StringName) -> Array[String]:
#	var char = Character
#	return char
