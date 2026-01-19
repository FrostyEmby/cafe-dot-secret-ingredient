extends Control

var egg_selected : bool = false
var hatchery_selected : bool = false

var egg_match : Egg
var hatchery_match : Hatchery

# checks if player selected an egg and hatchery
func _check_match():
	if egg_selected and hatchery_selected:
		# turn off the button and visibility to make egg disappear
		egg_match.disabled = true
		egg_match.visible = false
		
		# use egg button data to add that variety to the hatchery
		hatchery_match.add_egg(egg_match)
		
		# turn off again once match is found
		egg_selected = false
		hatchery_selected = false


func _on_egg_selection(egg: Egg) -> void:
	egg_match = egg
	egg_selected = true
	_check_match()


func _on_incubator_selection(hatchery: Hatchery) -> void:
	hatchery_match = hatchery
	hatchery_selected = true
	_check_match()
