extends Sprite2D

signal holding(held_creature : EggData)
signal releasing(released_creature : EggData)

var active : bool = false
var creature : Egg = Egg.new()

#TODO: make this the hub for matching between the shelf and everything else

func _init():
	visible = false
	active = false


# determines appearance based on held egg/creature
func _get_appearance():
	if creature.info.adult:
		return creature.info.species.adult_sprite
	elif creature.info.hatched:
		return creature.info.species.baby_sprite
	else:
		return creature.info.species.egg


func hold(held_creature : Egg):
	holding.emit(held_creature)
	creature = held_creature
	texture = _get_appearance()
	visible = true
	active = true
	#$Take.play() need to remove from shelf first


func release():
	releasing.emit(creature)
	visible = false
	active = false
	$Place.play()


# determines if a press does not emit release, in which case send the creature back
func _outside_press():
	# waits a small amount of time to make sure release() doesn't start
	$Removal.start(.1)
	await $Removal.timeout
	if active: # removes egg if release() does not get pressed
		visible = false
		active = false
		creature.visible = true # since creature is copied, makes it visible where it came from


# TODO: if pressed outside of area like hachery or terrarium, return to initial spot
func _process(_delta: float) -> void:
	global_position = get_global_mouse_position()
	
	# removes and returns item if release() doesn't happen first
	if active and Input.is_action_pressed("stop holding"):
		_outside_press()
