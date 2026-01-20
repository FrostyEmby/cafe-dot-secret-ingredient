extends MarginContainer

var save : Save = load("res://resources/save.tres")
signal selection(egg: Egg)

func _ready() -> void:
	_load()


func add_egg(egg: Egg):
	print("adding egg to shelf")
	for new_egg in find_children("Egg*"):
		if not new_egg.visible:
			print("found empty slot")
			new_egg.config(true, egg.info.species)
			print("filled empty slot")
			break
	print("no valid spot found")


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
	var egg1 = $"Organizer/ScrollContainer/MarginContainer/Egg Grid/Egg1"
	var egg2 = $"Organizer/ScrollContainer/MarginContainer/Egg Grid/Egg2"
	var egg3 = $"Organizer/ScrollContainer/MarginContainer/Egg Grid/Egg3"
	var egg4 = $"Organizer/ScrollContainer/MarginContainer/Egg Grid/Egg4"
	var egg5 = $"Organizer/ScrollContainer/MarginContainer/Egg Grid/Egg5"
	var egg6 = $"Organizer/ScrollContainer/MarginContainer/Egg Grid/Egg6"
	var egg7 = $"Organizer/ScrollContainer/MarginContainer/Egg Grid/Egg7"
	var egg8 = $"Organizer/ScrollContainer/MarginContainer/Egg Grid/Egg8"
	var egg9 = $"Organizer/ScrollContainer/MarginContainer/Egg Grid/Egg9"
	var egg10 = $"Organizer/ScrollContainer/MarginContainer/Egg Grid/Egg10"
	var egg11 = $"Organizer/ScrollContainer/MarginContainer/Egg Grid/Egg11"
	var egg12 = $"Organizer/ScrollContainer/MarginContainer/Egg Grid/Egg12"
	var egg13 = $"Organizer/ScrollContainer/MarginContainer/Egg Grid/Egg13"
	var egg14 = $"Organizer/ScrollContainer/MarginContainer/Egg Grid/Egg14"
	var egg15 = $"Organizer/ScrollContainer/MarginContainer/Egg Grid/Egg15"
	var egg16 = $"Organizer/ScrollContainer/MarginContainer/Egg Grid/Egg16"
	
	print("-----starting shelf setup-----")
	
	egg1.setup(save.shelf.egg1)
	egg2.setup(save.shelf.egg2)
	egg3.setup(save.shelf.egg3)
	egg4.setup(save.shelf.egg4)
	egg5.setup(save.shelf.egg1)
	egg6.setup(save.shelf.egg1)
	egg7.setup(save.shelf.egg1)
	egg8.setup(save.shelf.egg1)
	egg9.setup(save.shelf.egg1)
	egg10.setup(save.shelf.egg2)
	egg11.setup(save.shelf.egg3)
	egg12.setup(save.shelf.egg4)
	egg13.setup(save.shelf.egg1)
	egg14.setup(save.shelf.egg1)
	egg15.setup(save.shelf.egg1)
	egg16.setup(save.shelf.egg1)
	
	print("-----egg shelf setup complete-----")
