extends Button
class_name Terrarium

var save = load("res://resources/save.tres")

signal selection(terrarium : Terrarium)


func _ready():
	_load()


func _pressed() -> void:
	selection.emit(self)


# adds it to the space that determines life or death
func _space():
	match self.name.to_lower():
		"all":
			return CreatureStats.hatchery.ALL
		"lava":
			return CreatureStats.habitat.VOLCANO
		"aquatic":
			return CreatureStats.habitat.AQUATIC
		"sand":
			return CreatureStats.habitat.DESERT
		"jungle":
			return CreatureStats.habitat.JUNGLE
		"snow":
			return CreatureStats.habitat.SNOW
		"grass":
			return CreatureStats.habitat.GRASSLAND
		_:
			return CreatureStats.habitat.NONE


func has_space():
	for new_creature in find_children("Creature*"):
		if not new_creature.visible:
			return true
	return false


func add(creature : Egg):
	print("adding egg to terrarium")
	for new_creature in find_children("Creature*"):
		if not new_creature.visible:
			print("found empty slot")
			new_creature.setup(creature.info)
			new_creature.info.space = _space()
			new_creature.change_visibility(true)
			new_creature.mature()
			_save()
			print("filled empty slot")
			break
	print("no valid spot found")


func _load():
	$Creature1.setup(save[self.name.to_lower()].creature1)
	$Creature2.setup(save[self.name.to_lower()].creature2)
	$Creature3.setup(save[self.name.to_lower()].creature3)
	$Creature4.setup(save[self.name.to_lower()].creature4)

func _save():
	save[self.name.to_lower()].creature1 = $Creature1.info
	save[self.name.to_lower()].creature2 = $Creature2.info
	save[self.name.to_lower()].creature3 = $Creature3.info
	save[self.name.to_lower()].creature4 = $Creature4.info
