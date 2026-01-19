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
