extends Button
class_name Egg

signal selection(egg : Egg)
signal death(egg : Egg)
signal birth
signal corpse

var hatch_pause : bool = false
var age_pause : bool = false

var save = load("res://resources/save.tres")

@export var info : EggData = EggData.new()
@onready var hatch_timer : Timer = $Hatch
@onready var age_timer : Timer = $Age

func _set_appearance():
	if info.dead:
		_dead(false)
	elif info.adult:
		_mature()
	elif info.hatched:
		_hatch(false)
	else:
		icon = info.species.egg


func change_visibility(visibility : bool):
	visible = visibility
	info.visibility = visibility
	_save()


func enable(enabling : bool):
	info.enabled = enabling
	_save()

func reset():
	print("back to defaults")
	
	info.enabled = false
	info.species = load("res://resources/creatures/17-bird-one.tres")
	info.hatch_time = info.species.hatch_time_secs
	info.incubating = false
	info.hatched = false
	info.aging_time = info.species.maturity_time_secs
	info.maturing = false
	info.adult = false
	info.dead = false
	
	_set_appearance()
	change_visibility(false)
	_save()

# for creating new eggs at nest area
func new(creature : CreatureStats):
	print("new egg!")
	
	info.species = creature
	info.hatch_time = creature.hatch_time_secs
	info.incubating = false
	info.hatched = false
	info.aging_time = creature.maturity_time_secs
	info.maturing = false
	info.adult = false
	info.dead = false
	
	_set_appearance()
	change_visibility(true)
	_save()


func setup(id : EggData):
	print("starting " + self.name + " setup")
	
	change_visibility(id.visibility)
	
	info.enabled = id.enabled
	info.species = id.species
	info.hatch_time = id.hatch_time
	info.incubating = id.incubating
	info.hatched = id.hatched
	info.maturing = id.maturing
	info.adult = id.adult
	info.dead = id.dead
	info.placement = id.placement
	info.space = id.space
	
	_set_appearance()
	
	print(self.name + " setup complete")


func _ready():
	_load()


func _pressed() -> void:
	print("egg pressed")
	
	info.enabled = false
	
	if info.dead:
		change_visibility(false)
		reset()
		death.emit(self)
		print("corpse removed")
	elif info.hatched:
		selection.emit(self)
		print("baby taken")
	else:
		selection.emit(self)


func incubate():
	print("----INCUBATION START!----")
	hatch_timer.start(info.species.hatch_time_secs)
	info.enabled = true
	$Indicator.visible = true
	info.incubating = true
	change_visibility(false)


func grow_up():
	print("----GROWTH START!----")
	age_timer.start(info.species.maturity_time_secs)
	$Indicator.visible = true
	info.maturing = true


# Which will it be? Hope your placement was right!
func _hatch_or_death():
	change_visibility(true)
	
	if info.placement != info.species.incubator:
		print("PLACEMENT IS ", info.placement, " AND SHOULD BE ", info.species.incubator)
		_dead(true)
	else:
		_hatch()


func _survive_or_die():
	if info.space != info.species.terrarium:
		print("TERRARIUM IS ", info.space, " AND SHOULD BE ", info.species.terrarium)
		_dead(true)
	else:
		_mature()


func _hatch(sound : bool = true):
	print("hatched nice and healthy!")
	
	birth.emit()
	
	info.incubating = false
	info.hatched = true
	
	$Indicator.visible = false
	icon = info.species.baby_sprite
	
	# this updates the bestiary with new data from the hatch
	info.species.previously_hatched = true
	
	_save()
	
	if sound:
		$Good.play()

func _mature():
	print("grown nice and healthy!")
	
	info.maturing = false
	info.adult = true
	
	$Indicator.visible = false
	icon = load("res://art/egg mimic/check.png")
	
	_save()
	
	# this updates the bestiary with new data from the growth
	info.species.previously_grown = true


func _dead(sound : bool):
	print("hatched... but unfortunately dead")
	
	corpse.emit()
	
	info.incubating = false
	info.maturing = false
	info.hatched = true
	info.dead = true
	
	$Indicator.visible = false
	icon = load("res://art/eggs/corpse.png")
	
	_save()
	
	if sound:
		$Bad.play()


func _process(_delta: float) -> void:
	if info.incubating and hatch_timer.paused and not hatch_pause:
		incubate() 
	
	if info.hatch_time <= 0 and not info.hatched and not hatch_pause:
		#incubate()
		_hatch_or_death()
		
	if info.aging_time <= 0 and not info.adult and not age_pause:
		#grow_up()
		_survive_or_die()
	
	# update indicator timer when incubating
	if info.incubating:
		$Indicator.text = str(hatch_timer.time_left)
		info.hatch_time = hatch_timer.time_left
	
	# update indicator timer when aging
	if info.maturing:
		$Indicator.text = str(age_timer.time_left)
		info.aging_time = age_timer.time_left


func _on_hatch_timeout() -> void:
	_hatch_or_death()


func _on_hatch_tree_entered() -> void:
	# start incubating if placed and not already hatched
	if not info.hatched and not info.incubating and info.placement != info.species.hatchery.NONE:
		incubate()


func _on_age_timeout() -> void:
	_survive_or_die()


func _on_age_tree_entered() -> void:
	if info.hatched and not info.maturing and info.space != info.species.habitat.NONE:
		grow_up()


# when starting pause screen
func pause():
	if not $Hatch.paused:
		hatch_pause = true
		$Hatch.paused = true
	elif not $Age.paused:
		age_pause = true
		$Age.paused = true


# when continuing from pause screen
func play():
	if hatch_pause:
		hatch_pause = false
		$Hatch.paused = false
	elif age_pause:
		age_pause = false
		$Age.paused = false


# find the save parent of creature
func _find_parent():
	var parent = get_parent()
	
	# find parent
	while not parent.name.to_lower() in save:
		parent = parent.get_parent()
	
	return parent


func _save():
	save[_find_parent().name.to_lower()][self.name.to_lower()] = self.info


func _load():
	self.info = save[_find_parent().name.to_lower()][self.name.to_lower()]
	change_visibility(info.visibility)
	_set_appearance()
