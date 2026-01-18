extends Control

@export var creatures : Array[Creature]
var page : int = 0 # starts at 0 because of arrays

func _ready() -> void:
	_fill_page()

func _fill_page():
	
	# hide arrows at either extreme of the bestiary
	if page <= 0:
		$"Left Page/Prev Page".visible = false
	else:
		$"Left Page/Prev Page".visible = true
	
	if page + 2 >= creatures.size():
		$"Right Page/Next Page".visible = false
	else:
		$"Right Page/Next Page".visible = true
		
	# Fill in left page
	$"Left Page/Creature Name".text = creatures[page].name
	$"Left Page/Dynamic Text/Hint".text = "Hint: " + creatures[page].hint
	$"Left Page/Dynamic Text/Diet".text = "Diet: " + creatures[page].diet
	$"Left Page/Dynamic Text/Description".text = creatures[page].description
	$"Left Page/Confusion".text = "Confused with " + creatures[page].confused_with
	
	# if odd amount of creatures and on last page, clear the right page
	if creatures.size() % 2 != 0 && page == creatures.size() - 1:
		$"Right Page".visible = false
	else:
		$"Right Page".visible = true
		
		# Fill in right page
		$"Right Page/Creature Name".text = creatures[page+1].name
		$"Right Page/Dynamic Text/Hint".text = "Hint: " + creatures[page+1].hint
		$"Right Page/Dynamic Text/Diet".text = "Diet: " + creatures[page+1].diet
		$"Right Page/Dynamic Text/Description".text = creatures[page+1].description
		$"Right Page/Confusion".text = "Confused with " + creatures[page+1].confused_with


func _on_next_page_pressed() -> void:
	page += 2
	_fill_page()


func _on_prev_page_pressed() -> void:
	page -= 2
	_fill_page()


func _on_exit_pressed() -> void:
	pass # Replace with function body.
