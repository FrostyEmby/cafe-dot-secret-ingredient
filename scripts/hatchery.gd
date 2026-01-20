extends Button
class_name Hatchery

signal selection(hatchery : Hatchery)


func add_egg(egg: Egg):
	for new_egg in find_children("Egg*"):
		if not new_egg.visible:
			new_egg.config(true, egg.info.species)
			break


func _pressed() -> void:
	# if at least the last spot is open, then let egg match happen
	if not $Egg3.visible:
		selection.emit(self)

func setup(hatchery : HatcheryData):
	print("starting hatchery setup")
	
	$Egg1.setup(hatchery.egg1)
	$Egg1.setup(hatchery.egg2)
	$Egg1.setup(hatchery.egg3)
	
	print("hatchery setup complete")
