extends Button
class_name Hatchery

signal selection(hatchery : Hatchery)


func add_egg(egg: Egg):
	for new_egg in find_children("Egg*"):
		if not new_egg.visible:
			new_egg.species = egg.species
			new_egg.setup()
			new_egg.visible = true
			break


func _pressed() -> void:
	# if at least the last spot is open, then let egg match happen
	if not $Egg3.visible:
		selection.emit(self)
