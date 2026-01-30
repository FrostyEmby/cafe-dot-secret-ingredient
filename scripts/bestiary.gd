extends Control

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
	#$"Left Page/Adult Creature Picture Area".texture = creatures[page].adult_detailed
	#$"Left Page/Baby Creature Picture Area".texture = creatures[page].baby_detailed
	#$"Left Page/Egg".texture = creatures[page].egg
	
	# if odd amount of creatures and on last page, clear the right page
	if bestiary.creatures.size() % 2 != 0 && page == bestiary.creatures.size() - 1:
		$"Right Page".visible = false
	else:
		$"Right Page".visible = true
		
		# Fill in right page
		$"Right Page/Creature Name".text = bestiary.creatures[page+1].name
		$"Right Page/Dynamic Text/Description".text = bestiary.creatures[page+1].description
		#$"Right Page/Adult Creature Picture Area".texture = creatures[page+1].adult_detailed
		#$"Right Page/Baby Creature Picture Area".texture = creatures[page+1].baby_detailed
		#$"Right Page/Egg".texture = creatures[page+1].egg
		


func _on_next_page_pressed() -> void:
	page += 2
	_fill_page()


func _on_prev_page_pressed() -> void:
	page -= 2
	_fill_page()


func _on_exit_pressed() -> void:
	pass # Replace with function body.
