extends Button
class_name Hatchery

signal selection(hatchery : Hatchery)
signal hatch_select(egg : Egg, hatchery : Hatchery)

var save : Save = load("res://resources/save.tres")

# adds the placement which determines life or death
func _place():
	match self.name.to_lower():
		"all":
			return CreatureStats.hatchery.ALL
		"cold_dry":
			return CreatureStats.hatchery.COLD_DRY
		"cold_wet":
			return CreatureStats.hatchery.COLD_WET
		"temp_dry":
			return CreatureStats.hatchery.TEMPERATE_DRY
		"temp_wet":
			return CreatureStats.hatchery.TEMPERATE_WET
		"hot_dry":
			return CreatureStats.hatchery.HOT_DRY
		"hot_wet":
			return CreatureStats.hatchery.HOT_WET
		_:
			return CreatureStats.hatchery.NONE


func has_space():
	for new_egg in find_children("Egg*"):
		if not new_egg.info.enabled:
			return true
	return false


func add_egg(egg: Egg):
	for new_egg in find_children("Egg*"):
		if not new_egg.info.enabled:
			new_egg.setup(egg.info)
			new_egg.info.placement = _place()
			new_egg.info.enabled = true
			new_egg.change_visibility(true)
			new_egg.incubate()
			_save()
			print(self.name + " " + new_egg.name + " saved!")
			break


func _pressed() -> void:
	# if at least the last spot is open, then let egg match happen
	if not $Egg3.info.enabled:
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
		hatch_select.emit(egg, self)


func _on_egg_2_selection(egg: Egg) -> void:
	if egg.info.hatched:
		hatch_select.emit(egg, self)


func _on_egg_3_selection(egg: Egg) -> void:
	if egg.info.hatched:
		hatch_select.emit(egg, self)


func _on_egg_1_death(egg: Egg) -> void:
	egg.reset()
	save.incubator[self.name.to_lower()][egg.name.to_lower()] = egg.info


func _on_egg_2_death(egg: Egg) -> void:
	egg.reset()
	save.incubator[self.name.to_lower()][egg.name.to_lower()] = egg.info


func _on_egg_3_death(egg: Egg) -> void:
	egg.reset()
	save.incubator[self.name.to_lower()][egg.name.to_lower()] = egg.info
