extends Button
class_name Egg

signal selection(egg : Egg)
signal birth(creature : Creature)

@export var info : EggData = EggData.new()

func _set_appearance():
	if info.dead:
		_dead()
	elif info.hatched:
		_hatch()
	else:
		icon = info.species.egg

func config(visibility : bool, species : Creature, time_hatch : float = 15.0, incubation : bool = false, hatch : bool = false, death : bool = false):
	print("starting " + self.name + " config")
	
	visible = visibility
	info.visibility = visibility
	
	info.species = species
	
	info.hatch_time = time_hatch
	
	info.incubating = incubation
	
	info.hatched = hatch
	info.dead = death
	
	_set_appearance()
	
	print(self.name + " config complete")


func setup(id : EggData):
	print("starting " + self.name + " setup")
	
	visible = id.visibility
	info.visibility = id.visibility
	
	info.species = id.species
	
	info.hatch_time = id.hatch_time
	
	info.incubating = id.incubating
	
	info.hatched = id.hatched
	info.dead = id.dead
	
	_set_appearance()
	
	print(self.name + " setup complete")


func _ready():
	setup(info)


func _pressed() -> void:
	if info.dead:
		visible = false
		info.visibility = false
		disabled = true
		print("corpse removed")
	elif info.hatched:
		birth.emit(self.info.species)
		visible = false
		info.visibility = false
		disabled = true
		print("baby taken")
	else:
		selection.emit(self)


func incubate():
	print("incubation start!")
	$Hatch.start(info.hatch_time)
	info.incubating = true


# Which will it be? Hope your placement was right!
func _hatch_or_death():
	if info.placement != info.species.incubator:
		_dead()
	else:
		_hatch()


func _hatch():
	print("hatched nice and healthy!")
	
	disabled = false
	
	info.incubating = false
	info.hatched = true
	
	$Indicator.visible = false
	icon = info.species.baby_sprite


func _dead():
	print("hatched... but unfortunately dead")
	
	disabled = false
	
	info.incubating = false
	info.hatched = true
	info.dead = true
	icon = load("res://art/eggs/corpse.png")


func _process(_delta: float) -> void:
	# update indicator timer when incubating
	if info.incubating:
		$Indicator.text =  str($Hatch.time_left)


func _on_hatch_timeout() -> void:
	_hatch_or_death()


func _on_hatch_tree_entered() -> void:
	# start incubating if placed and not already hatched
	if not info.hatched and not info.incubating and info.placement != info.species.hatchery.NONE:
		incubate()


func _on_hatch_tree_exiting() -> void:
	info.hatch_time = $Hatch.time_left
