extends Resource
class_name EggData

@export var visibility : bool = false
@export var species : CreatureStats = load("res://resources/creatures/bird-one.tres")
@export var hatch_time : float = 15 #species.hatch_time_secs
@export var incubating : bool = false
@export var hatched : bool = false
@export var aging_time : float = 15
@export var maturing : bool = false
@export var adult : bool = false
@export var dead : bool = false
@export var placement : CreatureStats.hatchery = CreatureStats.hatchery.NONE
@export var space : CreatureStats.habitat = CreatureStats.habitat.NONE
