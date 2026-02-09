extends Resource
class_name Save

@export var egg_fill : bool = false # if flipped on, eggs randomly generate in egg collection

# EGG SHELF 
@export var shelf : EggShelfData = load("res://resources/egg-shelf.tres")

# INCUBATOR
#@export var incubator : IncubatorData = load("res://resources/incubator.tres")
@export var cold_dry : HatcheryData = load("res://resources/cold-dry.tres")
@export var cold_wet : HatcheryData = load("res://resources/cold-wet.tres")
@export var temp_dry : HatcheryData = load("res://resources/temp-dry.tres")
@export var temp_wet : HatcheryData = load("res://resources/temp-wet.tres")
@export var hot_dry : HatcheryData = load("res://resources/hot-dry.tres")
@export var hot_wet : HatcheryData = load("res://resources/hot-wet.tres")

# NESTS
@export var nest1 : NestData = load("res://resources/nest1.tres")
@export var nest2 : NestData = load("res://resources/nest2.tres")
@export var nest3 : NestData = load("res://resources/nest3.tres")

# TERRARIUMS
@export var snow : TerrariumData = load("res://resources/snow.tres")
@export var grass : TerrariumData = load("res://resources/grass.tres")
@export var sand : TerrariumData = load("res://resources/sand.tres")
@export var aqua : TerrariumData = load("res://resources/aqua.tres")
@export var jungle : TerrariumData = load("res://resources/jungle.tres")
@export var lava : TerrariumData = load("res://resources/lava.tres")

# BESTIARY
@export var bestiary : BestiaryData = load("res://resources/bestiary-data.tres")


# CLIPBOARD
@export var clipboard : ClipboardData = load("res://resources/clipboard.tres")
