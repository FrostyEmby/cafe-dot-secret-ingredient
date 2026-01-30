extends Button
class_name Egg

signal selection(egg : Egg)

@export var info : EggData = EggData.new()
@onready var hatch_timer : Timer = $Hatch


func _set_appearance():
	if info.dead:
		_dead()
	elif info.hatched:
		_hatch()
	else:
		icon = info.species.egg


func change_visibility(visibility : bool):
	visible = visibility
	info.visibility = visibility


func setup(id : EggData):
	print("starting " + self.name + " setup")
	
	change_visibility(id.visibility)
	
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
	print("egg pressed")
	if info.dead:
		visible = false
		info.visibility = false
		print("corpse removed")
	elif info.hatched:
		selection.emit(self)
		#visible = false
		#info.visibility = false
		print("baby taken")
	else:
		selection.emit(self)


func incubate():
	print("----INCUBATION START!----")
	hatch_timer.start(info.hatch_time)
	$Indicator.visible = true
	info.incubating = true


# Which will it be? Hope your placement was right!
func _hatch_or_death():
	if info.placement == info.species.incubator:
		_hatch()
	else:
		_dead()


func _hatch():
	print("hatched nice and healthy!")
	
	info.incubating = false
	info.hatched = true
	
	$Indicator.visible = false
	icon = info.species.baby_sprite


func _dead():
	print("hatched... but unfortunately dead")
	
	info.incubating = false
	info.hatched = true
	info.dead = true
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


func _on_hatch_timeout() -> void:
	_hatch_or_death()


func _on_hatch_tree_entered() -> void:
	# start incubating if placed and not already hatched
	if not info.hatched and not info.incubating and info.placement != info.species.hatchery.NONE:
		incubate()
