extends Resource
class_name EggData

@export var visibility : bool = false
@export var species : Creature = load("res://resources/bird-one.tres")
@export var hatch_time : float = 15 #species.hatch_time_secs
@export var incubating : bool = false
@export var hatched : bool = false
@export var dead : bool = false
@export var placement : Creature.hatchery = Creature.hatchery.NONE
