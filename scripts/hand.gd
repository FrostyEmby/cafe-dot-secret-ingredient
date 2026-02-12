extends Sprite2D

signal holding(held_creature : EggData)
signal releasing(released_creature : EggData)
signal fed

var active : bool = false
var gathering : bool = false
var creature : Egg = Egg.new()

#TODO: make this the hub for matching between the shelf and everything else

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN # hides mouse. This is your mouse now
	$Grip.frame = 0
	texture = null
	active = false
	$Tip.text = ""


func _get_tip() -> String:
	if creature.info.hatched:
		return creature.info.species.baby_tip
	else:
		return creature.info.species.egg_tip


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
	$Tip.text = _get_tip()
	#$Take.play() need to remove from shelf first

func release():
	releasing.emit(creature)
	$Grip.frame = 0
	texture = null
	active = false
	$Tip.text = ""
	$Place.play()


# determines if a press does not emit release, in which case send the creature back
func _outside_press():
	# waits a small amount of time to make sure release() doesn't start
	$Removal.start(.1)
	await $Removal.timeout
	if active and not gathering: # removes egg if release() does not get pressed
		$Grip.frame = 0
		texture = null
		active = false
		$Tip.text = ""
		creature.change_visibility(true) # since creature is copied, makes it visible where it came from
	elif active and gathering:
		active = false
		gathering = false
		$Grip.frame = 0
		texture = null

# extra visual for clicks
func _grip_ungrip():
	$Grip.frame = 1
	$Ungrip.start()
	await $Ungrip.timeout
	if not active:
		$Grip.frame = 0


func gather(food : CreatureStats.food_pref):
	# if active or currently gathering, don't proceed
	if active or gathering:
		return
	
	active = true
	gathering = true
	
	$Grip.frame = 1
	
	# changes texture to match the food you take
	match food:
		CreatureStats.food_pref.MEAT:
			texture = load("res://art/eggs/meat.png")
		CreatureStats.food_pref.PLANTS: 
			texture = load("res://art/eggs/plant.png")
		CreatureStats.food_pref.ELEMENTS: 
			texture = load("res://art/eggs/fish.png")
		CreatureStats.food_pref.FISH: 
			texture = load("res://art/eggs/fish.png")
		CreatureStats.food_pref.INSECTS:
			texture = load("res://art/eggs/insect.png")
		_:
			texture = load("res://art/eggs/corpse.png") # make it easy to spot bugs


func feed():
	active = false
	gathering = false
	$Grip.frame = 0
	texture = null
	fed.emit()


func _on_meat_pressed() -> void:
	gather(CreatureStats.food_pref.MEAT)


func _on_plant_pressed() -> void:
	gather(CreatureStats.food_pref.PLANTS)


func _on_candy_pressed() -> void:
	gather(CreatureStats.food_pref.SWEETS)


func _on_insect_pressed() -> void:
	gather(CreatureStats.food_pref.INSECTS)


func _on_element_pressed() -> void:
	gather(CreatureStats.food_pref.ELEMENTS)
	
	
func _process(_delta: float) -> void:
	global_position = get_global_mouse_position()
	
	# removes and returns item if release() doesn't happen first
	if active and Input.is_action_pressed("click"):
		_outside_press()
	elif not active and Input.is_action_pressed("click"):
		_grip_ungrip()
