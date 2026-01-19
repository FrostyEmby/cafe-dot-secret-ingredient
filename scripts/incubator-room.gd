extends Control

var egg_selected : bool = false
var hatchery_selected : bool = false

var egg_match : Egg
var hatchery_match : Hatchery

# checks if player selected an egg and hatchery
func _check_match():
	if egg_selected and hatchery_selected:
		egg_match.disabled = true
		hatchery_match.add_egg(egg_match)
		egg_selected = false
		hatchery_selected = false
