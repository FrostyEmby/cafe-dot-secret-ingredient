extends MarginContainer

var save : Save = load("res://resources/save.tres")
signal selection(egg: Egg)

func _ready() -> void:
	_load()


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
	
	save = load("res://resources/save.tres")
	
	egg1.visible = save.shelf_egg_1_visible
	egg1.species = save.shelf_egg_1_species
	
	egg2.visible = save.shelf_egg_2_visible
	egg2.species = save.shelf_egg_2_species
	
	egg3.visible = save.shelf_egg_3_visible
	egg3.species = save.shelf_egg_3_species
	
	egg4.visible = save.shelf_egg_4_visible
	egg4.species = save.shelf_egg_4_species
	
	egg5.visible = save.shelf_egg_5_visible
	egg5.species = save.shelf_egg_5_species
	
	egg6.visible = save.shelf_egg_6_visible
	egg6.species = save.shelf_egg_6_species
	
	egg7.visible = save.shelf_egg_7_visible
	egg7.species = save.shelf_egg_7_species
	
	egg8.visible = save.shelf_egg_8_visible
	egg8.species = save.shelf_egg_8_species
	
	egg9.visible = save.shelf_egg_9_visible
	egg9.species = save.shelf_egg_9_species
	
	egg10.visible = save.shelf_egg_10_visible
	egg10.species = save.shelf_egg_10_species
	
	egg11.visible = save.shelf_egg_11_visible
	egg11.species = save.shelf_egg_11_species
	
	egg12.visible = save.shelf_egg_12_visible
	egg12.species = save.shelf_egg_12_species
	
	egg13.visible = save.shelf_egg_13_visible
	egg13.species = save.shelf_egg_13_species
	
	egg14.visible = save.shelf_egg_14_visible
	egg14.species = save.shelf_egg_14_species
	
	egg15.visible = save.shelf_egg_15_visible
	egg15.species = save.shelf_egg_15_species
	
	egg16.visible = save.shelf_egg_16_visible
	egg16.species = save.shelf_egg_16_species
