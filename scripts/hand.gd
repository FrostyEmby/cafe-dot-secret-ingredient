extends Sprite2D

signal holding(held_creature : EggData)
signal releasing(released_creature : EggData)

var active : bool = false
var creature : Egg = Egg.new()

#TODO: make this the hub for matching between the shelf and everything else

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN # hides mouse. This is your mouse now
	$Grip.frame = 0
	texture = null
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
	$Grip.frame = 1
	creature = held_creature
	texture = _get_appearance()
	active = true
	#$Take.play() need to remove from shelf first


func release():
	releasing.emit(creature)
	$Grip.frame = 0
	texture = null
	active = false
	$Place.play()


# determines if a press does not emit release, in which case send the creature back
func _outside_press():
	# waits a small amount of time to make sure release() doesn't start
	$Removal.start(.1)
	await $Removal.timeout
	if active: # removes egg if release() does not get pressed
		$Grip.frame = 0
		texture = null
		active = false
		creature.visible = true # since creature is copied, makes it visible where it came from


# extra visual for clicks
func _grip_ungrip():
	$Grip.frame = 1
	$Ungrip.start()
	await $Ungrip.timeout
	if not active:
		$Grip.frame = 0


# TODO: if pressed outside of area like hachery or terrarium, return to initial spot
func _process(_delta: float) -> void:
	global_position = get_global_mouse_position()
	
	# removes and returns item if release() doesn't happen first
	if active and Input.is_action_pressed("click"):
		_outside_press()
	elif not active and Input.is_action_pressed("click"):
		_grip_ungrip()
