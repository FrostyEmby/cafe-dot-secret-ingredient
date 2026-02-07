extends Control

var active = true
var save = load("res://resources/save.tres")

func _ready() -> void:
	_fill_left()
	_fill_right()
	if save.shelf.open:
		$Shelf.move()
	
# returns whether right page can be displayed
func _right_fill_ok():
	if save.bestiary.creatures.size() % 2 != 0 && save.bestiary.page == save.bestiary.creatures.size() - 1:
		return false
	else:
		return true

func _fill_left():
	$"Left Page".visible = true
	
	# hide arrows at either extreme of the bestiary
	if save.bestiary.page <= 0:
		$"Left Page/Prev Page".visible = false
	else:
		$"Left Page/Prev Page".visible = true
	
	if save.bestiary.page + 2 >= save.bestiary.creatures.size():
		$"Right Page/Next Page".visible = false
	else:
		$"Right Page/Next Page".visible = true
		
	# Fill in left page
	$"Left Page/Creature Name".text = save.bestiary.creatures[save.bestiary.page].name
	$"Left Page/Adult Creature Picture".texture = save.bestiary.creatures[save.bestiary.page].adult_detailed
	$"Left Page/Dynamic Text/Description".text = save.bestiary.creatures[save.bestiary.page].description
	
	
	if save.bestiary.creatures[save.bestiary.page].previously_hatched:
		$"Left Page/Baby Creature Picture".texture = save.bestiary.creatures[save.bestiary.page].baby_sprite
		$"Left Page/Baby Creature Picture/Label".text = ""
		$"Left Page/Egg".texture = save.bestiary.creatures[save.bestiary.page].egg
		$"Left Page/Egg/Label".text = ""
		$"Left Page/Incubator/Label".text = save.bestiary.creatures[save.bestiary.page].hatchery.keys()[save.bestiary.creatures[save.bestiary.page].incubator].replace("_", " ")
	else:
		$"Left Page/Baby Creature Picture".texture = null
		$"Left Page/Baby Creature Picture/Label".text = "Baby"
		$"Left Page/Egg".texture = null
		$"Left Page/Egg/Label".text = "Egg"
		$"Left Page/Incubator/Label".text = "Incubator"
	
	if save.bestiary.creatures[save.bestiary.page].previously_grown:
		$"Left Page/Terrarium/Label".text = save.bestiary.creatures[save.bestiary.page].habitat.keys()[save.bestiary.creatures[save.bestiary.page].terrarium]
	else:
		$"Left Page/Terrarium/Label".text = "Terrarium"

# Fill in right page
func _fill_right():
	# exit immediately and turn off display if not able to fill
	if not _right_fill_ok():
		$"Right Page".visible = false
		return
	
	$"Right Page".visible = true
	
	$"Right Page/Creature Name".text = save.bestiary.creatures[save.bestiary.page+1].name
	$"Right Page/Adult Creature Picture Area".texture = save.bestiary.creatures[save.bestiary.page+1].adult_detailed
	$"Right Page/Dynamic Text/Description".text = save.bestiary.creatures[save.bestiary.page+1].description
	
	if save.bestiary.creatures[save.bestiary.page+1].previously_hatched:
		$"Right Page/Baby Creature Picture Area".texture = save.bestiary.creatures[save.bestiary.page+1].baby_sprite
		$"Right Page/Baby Creature Picture Area/Label".text = ""
		
		$"Right Page/Egg".texture = save.bestiary.creatures[save.bestiary.page+1].egg
		$"Right Page/Egg/Label".text = ""
		$"Right Page/Incubator/Label".text = save.bestiary.creatures[save.bestiary.page+1].hatchery.keys()[save.bestiary.creatures[save.bestiary.page+1].incubator].replace("_", " ")
		
		$"Right Page/Terrarium/Label".text = save.bestiary.creatures[save.bestiary.page+1].habitat.keys()[save.bestiary.creatures[save.bestiary.page+1].terrarium]
	else:
		$"Right Page/Baby Creature Picture Area".texture = null
		$"Right Page/Baby Creature Picture Area/Label".text = "Baby"
		
		$"Right Page/Egg".texture = null
		$"Right Page/Egg/Label".text = "Egg"
		$"Right Page/Incubator/Label".text = "Incubator"
	
	if save.bestiary.creatures[save.bestiary.page+1].previously_grown:
		$"Right Page/Terrarium/Label".text = save.bestiary.creatures[save.bestiary.page+1].habitat.keys()[save.bestiary.creatures[save.bestiary.page+1].terrarium]
	else:
		$"Right Page/Terrarium/Label".text = "Terrarium"


func _flip_sound():
	match randi_range(1, 5):
		1:
			$"Flip 1".play()
		2:
			$"Flip 2".play()
		3:
			$"Flip 3".play()
		4:
			$"Flip 4".play()
		5:
			$"Flip 5".play()


func _on_next_page_pressed() -> void:
	save.bestiary.page += 2
	$"Right Page".visible = false
	$FlipRight.visible = true
	$FlipRight.play()
	_flip_sound()


func _on_prev_page_pressed() -> void:
	save.bestiary.page -= 2
	$"Left Page".visible = false
	$FlipLeft.visible = true
	$FlipLeft.play()
	_flip_sound()


func _on_egg_gen_timeout() -> void:
	save.egg_fill = true


func _on_music_finished() -> void:
	if active:
		$Music.play()


func _on_flip_left_animation_finished() -> void:
	_fill_left()
	_fill_right()
	$FlipLeft.visible = false


func _on_flip_left_frame_changed() -> void:
	# so that it appears at page turn
	if $FlipLeft.frame == 2:
		_fill_left()


func _on_flip_right_animation_finished() -> void:
	_fill_left()
	_fill_right()
	$FlipRight.visible = false


func _on_flip_right_frame_changed() -> void:
	# so that it appears at page turn
	if $FlipRight.frame == 2:
		_fill_right()


func _on_pause() -> void:
	active = false
	$Music.stop()
	$"Mini Menu".visible = false


func _on_play() -> void:
	active = true
	$Music.play()
	$"Mini Menu".visible = true
