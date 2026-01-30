extends Control

var creature_selected : bool = false
var creature_match : Egg

@onready var shelf = $"BoxContainer/HSplitContainer/Egg Shelf"


func _on_egg_shelf_selection(creature: Egg) -> void:
	if creature.info.hatched:
		creature_selected = true
		creature_match = creature


func _match(terrarium : Terrarium):
	if creature_selected and terrarium.has_space():
		terrarium.add(creature_match)
		shelf.remove_egg(creature_match)
		creature_selected = false


func _on_snow_selection(terrarium : Terrarium) -> void:
	_match(terrarium)


func _on_grass_selection(terrarium : Terrarium) -> void:
	_match(terrarium)


func _on_sand_selection(terrarium : Terrarium) -> void:
	_match(terrarium)


func _on_aqua_selection(terrarium : Terrarium) -> void:
	_match(terrarium)


func _on_jungle_selection(terrarium : Terrarium) -> void:
	_match(terrarium)


func _on_lava_selection(terrarium : Terrarium) -> void:
	_match(terrarium)


func _on_music_finished() -> void:
	$Music.play()
