extends Button
class_name Egg

signal selection(egg : Egg)

@export var info : EggData = EggData.new()
@onready var hatch_timer : Timer = $Hatch
@onready var age_timer : Timer = $Age


func _set_appearance():
	if info.dead:
		_dead()
	elif info.adult:
		_mature()
	elif info.hatched:
		_hatch()
	else:
		icon = info.species.egg


func change_visibility(visibility : bool):
	visible = visibility
	info.visibility = visibility


func new(creature : CreatureStats):
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


func setup(id : EggData):
	print("starting " + self.name + " setup")
	
	change_visibility(id.visibility)
	
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
	setup(info)


func _pressed() -> void:
	print("egg pressed")
	if info.dead:
		visible = false
		info.visibility = false
		print("corpse removed")
	elif info.hatched:
		selection.emit(self)
		print("baby taken")
	else:
		selection.emit(self)


func incubate():
	print("----INCUBATION START!----")
	hatch_timer.start(info.species.hatch_time_secs)
	$Indicator.visible = true
	info.incubating = true


func grow_up():
	print("----GROWTH START!----")
	age_timer.start(info.species.maturity_time_secs)
	$Indicator.visible = true
	info.maturing = true

# Which will it be? Hope your placement was right!
func _hatch_or_death():
	if info.placement != info.species.incubator:
		print("PLACEMENT IS ", info.placement, " AND SHOULD BE ", info.species.incubator)
		_dead()
	else:
		_hatch()


func _survive_or_die():
	if info.space != info.species.terrarium:
		print("TERRARIUM IS ", info.placement, " AND SHOULD BE ", info.species.incubator)
		_dead()
	else:
		_mature()


func _hatch():
	print("hatched nice and healthy!")
	
	info.incubating = false
	info.hatched = true
	
	$Indicator.visible = false
	icon = info.species.baby_sprite

func _mature():
	print("grown nice and healthy!")
	
	info.maturing = false
	info.adult = true
	
	$Indicator.visible = false
	icon = info.species.adult_sprite


func _dead():
	print("hatched... but unfortunately dead")
	
	info.incubating = false
	info.maturing = false
	info.hatched = true
	info.dead = true
	
	$Indicator.visible = false
	icon = load("res://art/eggs/corpse.png")


func _process(_delta: float) -> void:
	if info.incubating and hatch_timer.paused:
		incubate() 
	
	if info.hatch_time <= 0 and not info.hatched:
		_hatch_or_death()
	
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
