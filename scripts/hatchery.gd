extends Button
class_name Hatchery

signal selection(hatchery : Hatchery)
signal hatch_select(egg : Egg)
var save : Save = load("res://resources/save.tres")


func add_egg(egg: Egg):
	for new_egg in find_children("Egg*"):
		if not new_egg.visible:
			new_egg.setup(egg.info)
			new_egg.incubate()
			_save()
			print(self.name + " " + new_egg.name + " saved!")
			break


func _pressed() -> void:
	# if at least the last spot is open, then let egg match happen
	if not $Egg3.visible:
		selection.emit(self)

func setup():
	print("starting hatchery " + self.name + " setup")
	
	$Egg1.setup(save.incubator[self.name.to_lower()].egg1)
	$Egg2.setup(save.incubator[self.name.to_lower()].egg2)
	$Egg3.setup(save.incubator[self.name.to_lower()].egg3)
	
	print("hatchery " + self.name + " setup complete")


func _save():
	save.incubator[self.name.to_lower()].egg1 = $Egg1.info
	save.incubator[self.name.to_lower()].egg2 = $Egg2.info
	save.incubator[self.name.to_lower()].egg3 = $Egg3.info


func _on_egg_1_selection(egg: Egg) -> void:
	if egg.info.hatched:
		hatch_select.emit(egg)


func _on_egg_2_selection(egg: Egg) -> void:
	if egg.info.hatched:
		hatch_select.emit(egg)


func _on_egg_3_selection(egg: Egg) -> void:
	if egg.info.hatched:
		hatch_select.emit(egg)
