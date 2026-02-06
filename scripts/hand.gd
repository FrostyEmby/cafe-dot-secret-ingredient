extends Sprite2D

signal holding(held_creature : EggData)
signal releasing(released_creature : EggData)

var active : bool = false
var creature : EggData = EggData.new()


func _init():
	visible = false
	active = false


# determines appearance based on held egg
func _get_appearance():
	if creature.adult:
		return creature.species.adult_sprite
	elif creature.hatched:
		return creature.species.baby_sprite
	else:
		return creature.species.egg

func hold(new_creature : EggData):
	holding.emit(new_creature)
	creature = new_creature
	texture = _get_appearance()
	visible = true
	active = true
	#$Take.play() need to remove from shelf first


func release():
	releasing.emit(creature)
	visible = false
	active = false
	$Place.play()


func _process(_delta: float) -> void:
	global_position = get_global_mouse_position()
	
