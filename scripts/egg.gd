extends Button
class_name Egg

@export var info : EggData = EggData.new()

signal selection(egg : Egg)


func config(visibility : bool, species : Creature):
	visible = visibility
	info.visibility = visibility
	info.species = species
	icon = info.species.egg


func setup(id : EggData):
	print("starting egg setup")
	
	visible = id.visibility
	info.visibility = id.visibility
	print("visible = ", id.visibility)
	
	info.species = id.species
	icon = info.species.egg
	
	print("egg setup complete")


func _ready():
	setup(info)


func _pressed() -> void:
	selection.emit(self)
