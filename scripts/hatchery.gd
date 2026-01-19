extends Button
class_name Hatchery

signal selection(hatchery : Hatchery)
var eggs : Array[Egg]


func add_egg(egg: Egg):
	eggs.append(egg)


func _pressed() -> void:
	selection.emit(self)
