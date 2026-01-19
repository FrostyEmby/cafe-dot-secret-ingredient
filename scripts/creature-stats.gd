extends Resource
class_name Creature

@export var name : String
@export var diet : String
@export var hint : String
@export var confused_with : String
@export var description : String

enum hatchery {COLD_DRY, COLD_WET, TEMPERATE_DRY, TEMPERATE_WET, HOT_DRY, HOT_WET}
enum habitat {VOLCANO, AQUATIC, DESERT, JUNGLE, SNOW, GRASSLAND}

@export var incubator : hatchery
@export var terrarium : habitat

@export var egg : Texture2D
@export var baby_sprite : Texture2D
@export var baby_detailed : Texture2D
@export var adult_sprite : Texture2D
@export var adult_detailed : Texture2D
