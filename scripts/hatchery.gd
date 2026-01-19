extends Button
class_name Hatchery

signal selection(hatchery : Hatchery)


func add_egg(egg: Egg):
	if not $Egg1.visible:
		$Egg1.icon = egg.icon
		$Egg1.visible = true
	elif not $Egg2.visible:
		$Egg2.icon = egg.icon
		$Egg2.visible = true
	elif not $Egg3.visible:
		$Egg3.icon = egg.icon
		$Egg3.visible = true


func _pressed() -> void:
	selection.emit(self)
