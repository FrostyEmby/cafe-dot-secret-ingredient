extends Button
class_name Egg

signal selection(egg : Egg)

func _pressed() -> void:
	selection.emit(self)
