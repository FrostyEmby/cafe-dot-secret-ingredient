extends Control

var save : Save = load("res://resources/save.tres")

@onready var shelf = $"BoxContainer/HSplitContainer/Egg Shelf"

func _ready() -> void:
	_load()


func _move_egg(egg: Egg):
	# make sure it has space before adding
	if shelf.has_space():
		# movement and visibility updates
		shelf.add_egg(egg)
		egg.change_visibility(false) # change original egg to invisible to show movement
		# update save
		$Nest1.save(save.nest1)
		$Nest2.save(save.nest2)
		$Nest3.save(save.nest3)


func _on_nest_selection(egg: Egg) -> void:
	_move_egg(egg)


func _on_nest_2_selection(egg: Egg) -> void:
	_move_egg(egg)


func _on_nest_3_selection(egg: Egg) -> void:
	_move_egg(egg)


func _load():
	$Nest1.setup(save.nest1)
	$Nest2.setup(save.nest2)
	$Nest3.setup(save.nest3)
