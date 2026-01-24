extends Control

var save : Save = load("res://resources/save.tres")

func _ready() -> void:
	_load()


func _move_egg(egg: Egg):
	var shelf = $"BoxContainer/HSplitContainer/Egg Shelf"
	shelf.add_egg(egg)
	#egg.disabled = true
	egg.change_visibility(false)


func _on_nest_selection(egg: Egg) -> void:
	_move_egg(egg)
	save.nest1[egg.name.to_lower()].visibility = false
	#save.nest1[egg.name.to_lower()].species = egg.info.species


func _on_nest_2_selection(egg: Egg) -> void:
	_move_egg(egg)
	#save.nest2[egg.name.to_lower()].visibility = false
	#save.nest2[egg.name.to_lower()].species = egg.info.species


func _on_nest_3_selection(egg: Egg) -> void:
	_move_egg(egg)
	#save.nest3[egg.name.to_lower()].visibility = false
	#save.nest3[egg.name.to_lower()].species = egg.info.species


func _load():
	$Nest1.setup(save.nest1)
	$Nest2.setup(save.nest2)
	$Nest3.setup(save.nest3)
