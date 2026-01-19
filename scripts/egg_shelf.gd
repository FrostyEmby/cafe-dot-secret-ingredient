extends MarginContainer

signal selection(egg: Egg)

func add_egg(egg: Egg):
	for new_egg in find_children("Egg*"):
		if not new_egg.visible:
			new_egg.species = egg.species
			new_egg.setup()
			new_egg.visible = true
			break

func _on_egg_1_selection(egg: Egg) -> void:
	selection.emit(egg)


func _on_egg_2_selection(egg: Egg) -> void:
	selection.emit(egg)


func _on_egg_3_selection(egg: Egg) -> void:
	selection.emit(egg)


func _on_egg_4_selection(egg: Egg) -> void:
	selection.emit(egg)


func _on_egg_5_selection(egg: Egg) -> void:
	selection.emit(egg)


func _on_egg_6_selection(egg: Egg) -> void:
	selection.emit(egg)


func _on_egg_7_selection(egg: Egg) -> void:
	selection.emit(egg)


func _on_egg_8_selection(egg: Egg) -> void:
	selection.emit(egg)


func _on_egg_9_selection(egg: Egg) -> void:
	selection.emit(egg)


func _on_egg_10_selection(egg: Egg) -> void:
	selection.emit(egg)


func _on_egg_11_selection(egg: Egg) -> void:
	selection.emit(egg)


func _on_egg_12_selection(egg: Egg) -> void:
	selection.emit(egg)


func _on_egg_13_selection(egg: Egg) -> void:
	selection.emit(egg)


func _on_egg_14_selection(egg: Egg) -> void:
	selection.emit(egg)


func _on_egg_15_selection(egg: Egg) -> void:
	selection.emit(egg)


func _on_egg_16_selection(egg: Egg) -> void:
	selection.emit(egg)
