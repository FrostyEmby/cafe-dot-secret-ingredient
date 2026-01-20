extends MarginContainer

var save : Save = load("res://resources/save.tres")
signal selection(hatchery : Hatchery)

func _init() -> void:
	_load()

func _on_cold_dry_selection(hatchery: Hatchery) -> void:
	selection.emit(hatchery)


func _on_temp_dry_selection(hatchery: Hatchery) -> void:
	selection.emit(hatchery)


func _on_hot_dry_selection(hatchery: Hatchery) -> void:
	selection.emit(hatchery)


func _on_cold_wet_selection(hatchery: Hatchery) -> void:
	selection.emit(hatchery)


func _on_temp_wet_selection(hatchery: Hatchery) -> void:
	selection.emit(hatchery)


func _on_hot_wet_selection(hatchery: Hatchery) -> void:
	selection.emit(hatchery)

func _load():
	pass
