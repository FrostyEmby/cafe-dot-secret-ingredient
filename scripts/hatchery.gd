extends Button
class_name Hatchery

signal selection(hatchery : Hatchery)
var save : Save = load("res://resources/save.tres")


func add_egg(egg: Egg):
	for new_egg in find_children("Egg*"):
		if not new_egg.visible:
			new_egg.config(true, egg.info.species)
			save.incubator[self.name.to_lower()][new_egg.name.to_lower()].visibility = true
			save.incubator[self.name.to_lower()][new_egg.name.to_lower()].species = egg.info.species
			print(self.name + " " + new_egg.name + " saved!")
			break


func _pressed() -> void:
	# if at least the last spot is open, then let egg match happen
	if not $Egg3.visible:
		selection.emit(self)

func setup():
	print("starting hatchery " + self.name + " setup")
	
	$Egg1.setup(save.incubator[self.name.to_lower()].egg1)
	$Egg1.setup(save.incubator[self.name.to_lower()].egg1)
	$Egg1.setup(save.incubator[self.name.to_lower()].egg1)
	
	print("hatchery " + self.name + " setup complete")
