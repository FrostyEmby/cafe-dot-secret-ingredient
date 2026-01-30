extends TextureRect

signal selection(egg: Egg)
var bestiary : BestiaryData = load("res://resources/bestiary-data.tres")

func remove_egg(egg: Egg):
	egg.change_visibility(false)


# finds first invisible egg, selects random species, and sets it to that
func generate_egg():
	for egg in find_children("Egg*"):
		if not egg.visible:
			egg.new(bestiary.creatures.pick_random()) 
			break


func _on_egg_1_selection(egg: Egg) -> void:
	selection.emit(egg)


func _on_egg_2_selection(egg: Egg) -> void:
	selection.emit(egg)


func _on_egg_3_selection(egg: Egg) -> void:
	selection.emit(egg)


func _on_egg_4_selection(egg: Egg) -> void:
	selection.emit(egg)


func _on_egg_5_selection(egg: Egg) -> void:
	selection.emit(egg)


func _on_egg_6_selection(egg: Egg) -> void:
	selection.emit(egg)


func setup(nest : NestData):
	print("loading nest")
	
	$Egg1.setup(nest.egg1)
	$Egg2.setup(nest.egg2)
	$Egg3.setup(nest.egg3)
	$Egg4.setup(nest.egg4)
	$Egg5.setup(nest.egg5)
	$Egg6.setup(nest.egg6)
	
	print("nest loaded!")

func save(nest : NestData):
	nest.egg1 = $Egg1.info
	nest.egg2 = $Egg2.info
	nest.egg3 = $Egg3.info
	nest.egg4 = $Egg4.info
	nest.egg5 = $Egg5.info
	nest.egg6 = $Egg6.info
