class_name Relic
extends Resource


#region enums
## One of the 4 types of relics, partially denoting possible loot.
enum Type {
	MESAN,    ##.
	LIX,      ##.
	NILIK,    ##.
	QUAN      ##.
}

## Progression of the relic, in void memories, out of 100.
## The higher the tier, the higher the chances of higher-rarity loot.
enum Radiance {
	T0 = 0,   ## 60/30/10%
	T1 = 25,  ## 50/35/15%
	T2 = 50,  ## 40/40/20%
	T3 = 100  ## 20/50/30%
}
#endregion


## One of the 4 types of relics, partially denoting possible loot.
@export var type: Type

## Progression of the relic, in void memories, out of 100.
## The higher the tier, the higher the chances of higher-rarity loot.
@export var radiance: Radiance

@export var bronze: Array[RelicLoot]
@export var silver: Array[RelicLoot]
@export var gold: Array[RelicLoot]
