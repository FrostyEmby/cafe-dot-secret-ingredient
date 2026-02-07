extends Control

var egg_selected : bool = false
var egg_match : Egg
var hatchery_match : Hatchery
var save : Save = load("res://resources/save.tres")

# matches egg and hatchery
func _match():
	# if hatchery has space, then proceed with matching
	if hatchery_match.has_space():
		# turn off the button and visibility to make egg disappear
		$Shelf.remove_egg(egg_match)
		
		# use egg button data to add that variety to the hatchery
		hatchery_match.add_egg(egg_match)
		
		# turn off again once match is found
		egg_selected = false
		
		# remove dragged egg
		$Hand.release()
	else:
		print("no space, match cancelled")


func _on_egg_selection(egg: Egg) -> void:
	egg_match = egg
	egg_selected = true
	egg.visible = false
	$Hand.hold(egg)


# selection only goes one way, because egg -> hatchery 
# makes more sense than hatchery -> egg
func _on_incubator_selection(hatchery: Hatchery) -> void:
	if egg_selected:
		hatchery_match = hatchery
		_match()


func _on_egg_gen_timeout() -> void:
	save.egg_fill = true


func _on_music_finished() -> void:
	$Music.play()
