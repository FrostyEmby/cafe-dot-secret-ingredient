extends Button
class_name Hatchery

signal selection(hatchery : Hatchery)
signal hatch_select(egg : Egg, hatchery : Hatchery)

var save : Save = load("res://resources/save.tres")


func _ready() -> void:
	setup()


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


# change num eggs displayed
func _change_egg_num(diff : int):
	save.incubator[self.name.to_lower()].egg_count += diff
	print("count is now ", save.incubator[self.name.to_lower()].egg_count)
	_egg_display()


# changes visuals based on number of eggs
func _egg_display():
	print("displaying egg number")
	match self.name.to_lower():
		"cold_dry":
			_cold_dry_egg_display()
		"cold_wet":
			_cold_wet_egg_display()
		"temp_dry":
			_temp_dry_egg_display()
		"temp_wet":
			_temp_wet_egg_display()
		"hot_dry":
			_hot_dry_egg_display()
		"hot_wet":
			_hot_wet_egg_display()

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
			_change_egg_num(1)
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
	
	_egg_display()
	
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
	
func _cold_dry_egg_display():
	match save.incubator.cold_dry.egg_count:
		0:
			$Display.texture = null
		1:
			$Display.texture = load("res://art/final props/incubators/dry left egg1.png")
		2:
			$Display.texture = load("res://art/final props/incubators/dry left egg2.png")
		3:
			$Display.texture = load("res://art/final props/incubators/dry left egg3.png")


func _temp_dry_egg_display():
	match save.incubator.temp_dry.egg_count:
		0:
			$Display.texture = null
		1:
			$Display.texture = load("res://art/final props/incubators/dry middle egg1.png")
		2:
			$Display.texture = load("res://art/final props/incubators/dry middle egg2.png")
		3:
			$Display.texture = load("res://art/final props/incubators/dry middle egg3.png")


func _hot_dry_egg_display():
	match save.incubator.hot_dry.egg_count:
		0:
			$Display.texture = null
		1:
			$Display.texture = load("res://art/final props/incubators/dry right egg1.png")
		2:
			$Display.texture = load("res://art/final props/incubators/dry right egg2.png")
		3:
			$Display.texture = load("res://art/final props/incubators/dry right egg3.png")


func _cold_wet_egg_display():
	match save.incubator.cold_wet.egg_count:
		0:
			$Display.texture = null
		1:
			$Display.texture = load("res://art/final props/incubators/wet left egg1.png")
		2:
			$Display.texture = load("res://art/final props/incubators/wet left egg2.png")
		3:
			$Display.texture = load("res://art/final props/incubators/wet left egg3.png")


func _temp_wet_egg_display():
	match save.incubator.temp_wet.egg_count:
		0:
			$Display.texture = null
		1:
			$Display.texture = load("res://art/final props/incubators/wet middle egg1.png")
		2:
			$Display.texture = load("res://art/final props/incubators/wet middle egg2.png")
		3:
			$Display.texture = load("res://art/final props/incubators/wet middle egg3.png")


func _hot_wet_egg_display():
	match save.incubator.hot_wet.egg_count:
		0:
			$Display.texture = null
		1:
			$Display.texture = load("res://art/final props/incubators/wet right egg1.png")
		2:
			$Display.texture = load("res://art/final props/incubators/wet right egg2.png")
		3:
			$Display.texture = load("res://art/final props/incubators/wet right egg3.png")


func _on_egg_1_birth() -> void:
	_change_egg_num(-1)


func _on_egg_2_birth() -> void:
	_change_egg_num(-1)


func _on_egg_3_birth() -> void:
	_change_egg_num(-1)


func _on_egg_1_corpse() -> void:
	_change_egg_num(-1)


func _on_egg_2_corpse() -> void:
	_change_egg_num(-1)


func _on_egg_3_corpse() -> void:
	_change_egg_num(-1)
