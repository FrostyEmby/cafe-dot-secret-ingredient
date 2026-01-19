extends Button
class_name Egg

@export var species : Creature = load("res://resources/bird-one.tres")
@export var shelved = false

signal selection(egg : Egg)


func setup():
	icon = species.egg


func _ready():
	setup()


func _pressed() -> void:
	selection.emit(self)
