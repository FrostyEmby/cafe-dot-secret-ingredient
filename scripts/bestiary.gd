extends Control

@export var creatures : Array[Creature]
var page : int = 0 # starts at 0 because of arrays

func _ready() -> void:
	_fill_page()
	$"Left Page/Prev Page".visible = false

func _fill_page():
	$"Left Page/Creature Name".text = creatures[page].name
	$"Right Page/Creature Name".text = creatures[page+1].name
	
	$"Left Page/Dynamic Text/Hint".text = "Hint: " + creatures[page].hint
	$"Right Page/Dynamic Text/Hint".text = "Hint: " + creatures[page+1].hint
	
	$"Left Page/Dynamic Text/Diet".text = "Diet: " + creatures[page].diet
	$"Right Page/Dynamic Text/Diet".text = "Diet: " + creatures[page+1].diet

	$"Left Page/Dynamic Text/Description".text = creatures[page].description
	$"Right Page/Dynamic Text/Description".text = creatures[page+1].description

	$"Left Page/Confusion".text = "Confused with " + creatures[page].confused_with
	$"Right Page/Confusion".text = "Confused with " + creatures[page+1].confused_with


func _on_next_page_pressed() -> void:
	page += 2
	_fill_page()
	
	$"Left Page/Prev Page".visible = true
	
	if page + 2 >= creatures.size():
		$"Right Page/Next Page".visible = false


func _on_prev_page_pressed() -> void:
	page -= 2
	_fill_page()
	
	$"Right Page/Next Page".visible = true
	
	if page <= 0:
		$"Left Page/Prev Page".visible = false


func _on_exit_pressed() -> void:
	pass # Replace with function body.
