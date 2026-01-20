extends Control

func _init() -> void:
	_load()


func _move_egg(egg: Egg):
	$"BoxContainer/HSplitContainer/Egg Shelf".add_egg(egg)
	egg.disabled = true
	egg.visible = false


func _on_nest_selection(egg: Egg) -> void:
	_move_egg(egg)


func _on_nest_2_selection(egg: Egg) -> void:
	_move_egg(egg)


func _on_nest_3_selection(egg: Egg) -> void:
	_move_egg(egg)


func _load():
	pass
