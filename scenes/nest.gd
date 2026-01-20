extends TextureRect

@export var init_eggs : int = 6
signal selection(egg: Egg)


func _ready() -> void:
	pass
	
	#var enabled_eggs = 0
	
	#for egg in find_children("Egg*"):
	#	if enabled_eggs < init_eggs:
	#		egg.disabled = false
	#		egg.visible = true
	#		enabled_eggs += 1
	#	else:
	#		egg.disabled = true
	#		egg.visible = false


func _on_egg_1_selection(egg: Egg) -> void:
	selection.emit(egg)


func _on_egg_2_selection(egg: Egg) -> void:
	selection.emit(egg)


func _on_egg_3_selection(egg: Egg) -> void:
	selection.emit(egg)


func _on_egg_4_selection(egg: Egg) -> void:
	selection.emit(egg)


func _on_egg_5_selection(egg: Egg) -> void:
	selection.emit(egg)


func _on_egg_6_selection(egg: Egg) -> void:
	selection.emit(egg)


func setup(nest : NestData):
	print("loading nest")
	
	$Egg1.setup(nest.egg1)
	$Egg2.setup(nest.egg2)
	$Egg3.setup(nest.egg3)
	$Egg4.setup(nest.egg4)
	$Egg5.setup(nest.egg5)
	$Egg6.setup(nest.egg6)
	
	print("nest loaded!")
