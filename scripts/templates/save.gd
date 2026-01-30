extends Resource
class_name Save

@export var egg_fill : bool = false # if flipped on, eggs randomly generate in egg collection

# EGG SHELF 
@export var shelf : EggShelfData = load("res://resources/egg-shelf.tres")

# INCUBATOR
@export var incubator : IncubatorData = load("res://resources/incubator.tres")

# NESTS
@export var nest1 : NestData = load("res://resources/nest1.tres")
@export var nest2 : NestData = load("res://resources/nest2.tres")
@export var nest3 : NestData = load("res://resources/nest3.tres")

# TERRARIUMS
@export var snow : TerrariumData
@export var grass : TerrariumData
@export var sand : TerrariumData
@export var aqua : TerrariumData
@export var jungle : TerrariumData
@export var lava : TerrariumData
