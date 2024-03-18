class_name RelicLoot
extends Resource


enum Rarity {
	BRONZE,  ## 20/16.66/13.33/6.66% chance to get this part in a relic it's in, based on radiance.
	SILVER,  ## 15/17.5 /20   /25%   chance to get this part in a relic it's in, based on radiance.
	GOLD     ## 10/15   /20   /30%   chance to get this part in a relic it's in, based on radiance.
}


## This depends on what relic it's in, so chances are prime parts
## will have to be instantiated and have their rarity set manually.
@export var rarity: Rarity

@export var icon: Texture2D
