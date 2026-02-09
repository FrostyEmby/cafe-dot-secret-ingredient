extends Control

var active : bool = true
var creature_selected : bool = false
var creature_match : Egg


func _on_egg_shelf_selection(creature: Egg) -> void:
	if creature.info.hatched:
		creature_selected = true
		creature_match = creature
		creature.visible = false
		$Hand.hold(creature)


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
	if active:
		$Music.play()


func _on_pause() -> void:
	active = false
	$Music.stop()
	$"Mini Menu".visible = false
	$Snow.active = false
	$Grass.active = false
	$Sand.active = false
	$Aqua.active = false
	$Jungle.active = false
	$Lava.active = false


func _on_play() -> void:
	active = true
	$Music.play()
	$"Mini Menu".visible = true
	$Snow.active = true
	$Grass.active = true
	$Sand.active = true
	$Aqua.active = true
	$Jungle.active = true
	$Lava.active = true
