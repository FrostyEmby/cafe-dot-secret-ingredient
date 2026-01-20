extends TextureRect

@export var init_eggs : int = 6
signal selection(egg: Egg)

func _ready() -> void:
	var enabled_eggs = 0
	
	for egg in find_children("Egg*"):
		if enabled_eggs < init_eggs:
			egg.disabled = false
			egg.visible = true
			enabled_eggs += 1
		else:
			egg.disabled = true
			egg.visible = false


func save():
	var save_dict = {
		"filename" : get_scene_file_path(),
		"parent" : get_parent().get_path(),
		"pos_x" : position.x, 
		"pos_y" : position.y,
		"egg_1_visible" : $Egg1.visible,
		"egg_1_species" : $Egg1.species,
		"egg_2_visible" : $Egg2.visible,
		"egg_2_species" : $Egg2.species,
		"egg_3_visible" : $Egg3.visible,
		"egg_3_species" : $Egg3.species,
		"egg_4_visible" : $Egg4.visible,
		"egg_4_species" : $Egg4.species,
		"egg_5_visible" : $Egg5.visible,
		"egg_5_species" : $Egg5.species,
		"egg_6_visible" : $Egg6.visible,
		"egg_6_species" : $Egg6.species
	}
	return save_dict


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
