extends Control

var save = load("res://resources/save.tres")
var bestiary : BestiaryData = load("res://resources/bestiary-data.tres")
var page : int = 0 # starts at 0 because of arrays

func _ready() -> void:
	_fill_page()

func _fill_page():
	# hide arrows at either extreme of the bestiary
	if page <= 0:
		$"Left Page/Prev Page".visible = false
	else:
		$"Left Page/Prev Page".visible = true
	
	if page + 2 >= bestiary.creatures.size():
		$"Right Page/Next Page".visible = false
	else:
		$"Right Page/Next Page".visible = true
		
	# Fill in left page
	$"Left Page/Creature Name".text = bestiary.creatures[page].name
	$"Left Page/Dynamic Text/Description".text = bestiary.creatures[page].description
	$"Left Page/Adult Creature Picture".texture = bestiary.creatures[page].adult_detailed
	
	if bestiary.creatures[page].previously_hatched:
		$"Left Page/Incubator/Label".text = bestiary.creatures[page].hatchery.keys()[bestiary.creatures[page].incubator].replace("_", " ")
		$"Left Page/Egg".texture = bestiary.creatures[page].egg
		$"Left Page/Egg/Label".text = ""
		$"Left Page/Baby Creature Picture".texture = bestiary.creatures[page].baby_sprite
		$"Left Page/Baby Creature Picture/Label".text = ""
	else:
		$"Left Page/Incubator/Label".text = "Incubator"
		$"Left Page/Egg".texture = Texture2D.new()
		$"Left Page/Egg/Label".text = "Egg"
		$"Left Page/Baby Creature Picture".texture = Texture2D.new()
		$"Left Page/Baby Creature Picture/Label".text = "Baby"
	
	if bestiary.creatures[page].previously_grown:
		$"Left Page/Terrarium/Label".text = bestiary.creatures[page].habitat.keys()[bestiary.creatures[page].terrarium]
		
	else:
		$"Left Page/Terrarium/Label".text = "Terrarium"
		
	
	# if odd amount of creatures and on last page, clear the right page
	if bestiary.creatures.size() % 2 != 0 && page == bestiary.creatures.size() - 1:
		$"Right Page".visible = false
	else:
		$"Right Page".visible = true
		
		# Fill in right page
		$"Right Page/Creature Name".text = bestiary.creatures[page+1].name
		$"Right Page/Dynamic Text/Description".text = bestiary.creatures[page+1].description
		$"Right Page/Adult Creature Picture Area".texture = bestiary.creatures[page+1].adult_detailed
		
		if bestiary.creatures[page+1].previously_hatched:
			$"Right Page/Incubator/Label".text = bestiary.creatures[page+1].hatchery.keys()[bestiary.creatures[page].incubator].replace("_", " ")
			$"Right Page/Egg".texture = bestiary.creatures[page+1].egg
			$"Right Page/Egg/Label".text = ""
			$"Right Page/Baby Creature Picture Area".texture = bestiary.creatures[page+1].baby_sprite
			$"Right Page/Baby Creature Picture Area/Label".text = ""
		else:
			$"Right Page/Incubator/Label".text = "Incubator"
			$"Right Page/Egg".texture = Texture2D.new()
			$"Right Page/Egg/Label".text = "Egg"
			$"Right Page/Baby Creature Picture Area".texture = Texture2D.new()
			$"Right Page/Baby Creature Picture Area/Label".text = "Baby"
		
		if bestiary.creatures[page+1].previously_grown:
			$"Right Page/Terrarium/Label".text = bestiary.creatures[page+1].habitat.keys()[bestiary.creatures[page].terrarium]
		else:
			$"Right Page/Terrarium/Label".text = "Terrarium"


func _on_next_page_pressed() -> void:
	page += 2
	_fill_page()


func _on_prev_page_pressed() -> void:
	page -= 2
	_fill_page()


func _on_exit_pressed() -> void:
	pass # Replace with function body.


func _on_egg_gen_timeout() -> void:
	save.egg_fill = true
