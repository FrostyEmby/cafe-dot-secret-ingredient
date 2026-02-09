# This class is for information to be displayed in the bestiary and to be used as a base for the species
extends Resource
class_name CreatureStats

enum physical {FLESH, PLANT, ELEMENTAL, FISH, INSECT}
enum food_pref {OMNIVORE, EGGS, INSECTS, MEAT, PLANTS, PURPLE_SNAIL, SWEETS, ELEMENTS, FISH}

@export var name : String
@export var type : physical
@export var diet : food_pref
@export var description : String

enum hatchery {NONE, ALL, COLD_DRY, COLD_WET, TEMPERATE_DRY, TEMPERATE_WET, HOT_DRY, HOT_WET}
enum habitat {NONE, ALL, VOLCANO, AQUATIC, DESERT, JUNGLE, SNOW, GRASSLAND}

@export var incubator : hatchery
@export var terrarium : habitat

@export var egg : Texture2D
@export var baby_sprite : Texture2D
#@export var baby_detailed : Texture2D
@export var adult_sprite : Texture2D
@export var adult_detailed : Texture2D

@export var hatch_time_secs : float = 15.0
@export var maturity_time_secs : float = 15.0

# While held, creatures may have additional info
@export var egg_tip : String = ""
@export var baby_tip : String = ""

# dynamic data
@export var previously_hatched : bool = false
@export var previously_grown : bool = false
@export var in_play : bool = false
