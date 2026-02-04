extends MarginContainer

var save : Save = load("res://resources/save.tres")
signal selection(egg: Egg)

@onready var egg1 = $Hold/Grid/Egg1
@onready var egg2 = $Hold/Grid/Egg2
@onready var egg3 = $Hold/Grid/Egg3
@onready var egg4 = $Hold/Grid/Egg4
@onready var egg5 = $Hold/Grid/Egg5
@onready var egg6 = $Hold/Grid/Egg6
@onready var egg7 = $Hold/Grid/Egg7
@onready var egg8 = $"Hold/Grid/Egg8"
@onready var egg9 = $"Hold/Grid/Egg9"
@onready var egg10 = $"Hold/Grid/Egg10"
@onready var egg11 = $"Hold/Grid/Egg11"
@onready var egg12 = $"Hold/Grid/Egg12"
@onready var egg13 = $"Hold/Grid/Egg13"
@onready var egg14 = $"Hold/Grid/Egg14"
@onready var egg15 = $"Hold/Grid/Egg15"
@onready var egg16 = $"Hold/Grid/Egg16"


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
	
	egg1.setup(save.shelf.egg1)
	egg2.setup(save.shelf.egg2)
	egg3.setup(save.shelf.egg3)
	egg4.setup(save.shelf.egg4)
	egg5.setup(save.shelf.egg5)
	egg6.setup(save.shelf.egg6)
	egg7.setup(save.shelf.egg7)
	egg8.setup(save.shelf.egg8)
	egg9.setup(save.shelf.egg9)
	egg10.setup(save.shelf.egg10)
	egg11.setup(save.shelf.egg11)
	egg12.setup(save.shelf.egg12)
	egg13.setup(save.shelf.egg13)
	egg14.setup(save.shelf.egg14)
	egg15.setup(save.shelf.egg15)
	egg16.setup(save.shelf.egg16)
	
	print("-----egg shelf setup complete-----")

func _save():
	save.shelf.egg1 = egg1.info
	save.shelf.egg2 = egg2.info
	save.shelf.egg3 = egg3.info
	save.shelf.egg4 = egg4.info
	save.shelf.egg5 = egg5.info
	save.shelf.egg6 = egg6.info
	save.shelf.egg7 = egg7.info
	save.shelf.egg8 = egg8.info
	save.shelf.egg9 = egg9.info
	save.shelf.egg10 = egg10.info
	save.shelf.egg11 = egg11.info
	save.shelf.egg12 = egg12.info
	save.shelf.egg13 = egg13.info
	save.shelf.egg14 = egg14.info
	save.shelf.egg15 = egg15.info
	save.shelf.egg16 = egg16.info


func _on_incubators_hatch_select(egg: Egg, hatchery : Hatchery) -> void:
	add_egg(egg)
	egg.reset()
	save.incubator[hatchery.name.to_lower()][egg.name.to_lower()] = egg.info
	


func _on_move_pressed() -> void:
	var movement = create_tween()
	if save.shelf.open:
		save.shelf.open = false
		movement.tween_property(self, "global_position", Vector2(-176,0), 0.1)
	else:
		save.shelf.open = true
		movement.tween_property(self, "global_position", Vector2(0,0), 0.1)
