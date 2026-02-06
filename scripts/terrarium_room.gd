extends Control

var creature_selected : bool = false
var creature_match : Egg


func _on_egg_shelf_selection(creature: Egg) -> void:
	if creature.info.hatched:
		creature_selected = true
		creature_match = creature
		creature.visible = false
		$Hand.hold(creature.info)


func _match(terrarium : Terrarium):
	if creature_selected and terrarium.has_space():
		terrarium.add(creature_match)
		$Shelf.remove_egg(creature_match)
		creature_selected = false
		$Hand.release()


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
