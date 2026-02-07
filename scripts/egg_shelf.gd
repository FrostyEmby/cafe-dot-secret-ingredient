extends MarginContainer


signal selection(egg: Egg)

var save : Save = load("res://resources/save.tres")


func _ready() -> void:
	_load()


func has_space():
	for new_egg in find_children("Egg*"):
		if not new_egg.info.enabled:
			return true
	return false


func add_egg(egg: Egg):
	print("adding egg to shelf")
	for new_egg in find_children("Egg*"):
		if not new_egg.info.enabled:
			print("found empty slot")
			new_egg.setup(egg.info)
			new_egg.change_visibility(true)
			new_egg.info.enabled = true
			_save()
			print("filled empty slot")
			$Take.play()
			break
	print("no valid spot found")


func remove_egg(egg: Egg):
	egg.change_visibility(false)
	egg.info.enabled = false
	_save()
	#save.shelf[egg.name.to_lower()].visibility = false


func _on_egg_1_selection(egg: Egg) -> void:
	print("selected egg 1")
	selection.emit(egg)


func _on_egg_2_selection(egg: Egg) -> void:
	print("selected egg 2")
	selection.emit(egg)


func _on_egg_3_selection(egg: Egg) -> void:
	print("selected egg 3")
	selection.emit(egg)


func _on_egg_4_selection(egg: Egg) -> void:
	print("selected egg 4")
	selection.emit(egg)


func _on_egg_5_selection(egg: Egg) -> void:
	print("selected egg 5")
	selection.emit(egg)


func _on_egg_6_selection(egg: Egg) -> void:
	print("selected egg 6")
	selection.emit(egg)


func _on_egg_7_selection(egg: Egg) -> void:
	print("selected egg 7")
	selection.emit(egg)


func _on_egg_8_selection(egg: Egg) -> void:
	print("selected egg 8")
	selection.emit(egg)


func _on_egg_9_selection(egg: Egg) -> void:
	print("selected egg 9")
	selection.emit(egg)


func _on_egg_10_selection(egg: Egg) -> void:
	print("selected egg 10")
	selection.emit(egg)


func _on_egg_11_selection(egg: Egg) -> void:
	print("selected egg 11")
	selection.emit(egg)


func _on_egg_12_selection(egg: Egg) -> void:
	print("selected egg 12")
	selection.emit(egg)


func _on_egg_13_selection(egg: Egg) -> void:
	print("selected egg 13")
	selection.emit(egg)


func _on_egg_14_selection(egg: Egg) -> void:
	print("selected egg 14")
	selection.emit(egg)


func _on_egg_15_selection(egg: Egg) -> void:
	print("selected egg 15")
	selection.emit(egg)


func _on_egg_16_selection(egg: Egg) -> void:
	print("selected egg 16")
	selection.emit(egg)

func _load():
	print("-----starting shelf setup-----")
	
	if save.shelf.open:
		position = Vector2(0,0)
	else:
		position = Vector2(-176,0)
	
	for egg in find_children("Egg*"):
		egg.setup(save.shelf[egg.name.to_lower()])
	
	print("-----egg shelf setup complete-----")

func _save():
	for egg in find_children("Egg*"):
		save.shelf[egg.name.to_lower()] = egg.info


func _on_incubators_hatch_select(egg: Egg, hatchery : Hatchery) -> void:
	add_egg(egg)
	egg.reset()
	save.incubator[hatchery.name.to_lower()][egg.name.to_lower()] = egg.info


func move():
	var movement = create_tween()
	if save.shelf.open:
		save.shelf.open = false
		movement.tween_property(self, "global_position", Vector2(-176,0), 0.1)
	else:
		save.shelf.open = true
		movement.tween_property(self, "global_position", Vector2(0,0), 0.1)
	
