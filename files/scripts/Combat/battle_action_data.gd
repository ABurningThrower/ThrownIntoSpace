## Script for keeping track of enemy data based on resource.
class_name BattleActionData
extends Resource

# an action should be able to have multiple of these options potentially (i.e. be a ranged debuff which heals, in case of some leeching dart, for example) and as such this var should be a "choose all that apply" sort of thing. Displayed as a tag on hover
'''
var _Type: Dictionary = {
	"damaging": ["melee", "ranged", "magic", "techno"],
	"support": ["buff", "debuff", "heal"],
	"misc": ["defensive", "evasive", "notepad"],
}

@export var type: Array[_Type] '''
@export var name: String
@export var icon: Texture2D
# @export var effects: BattleActionFX
