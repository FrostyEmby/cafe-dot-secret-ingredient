extends MarginContainer

var save : Save = load("res://resources/save.tres")
signal selection(hatchery : Hatchery)

func _ready() -> void:
	_load()

func _on_cold_dry_selection(hatchery: Hatchery) -> void:
	print("selected cold dry hatchery")
	selection.emit(hatchery)


func _on_temp_dry_selection(hatchery: Hatchery) -> void:
	print("selected temp dry hatchery")
	selection.emit(hatchery)


func _on_hot_dry_selection(hatchery: Hatchery) -> void:
	print("selected hot dry hatchery")
	selection.emit(hatchery)


func _on_cold_wet_selection(hatchery: Hatchery) -> void:
	print("selected cold wet hatchery")
	selection.emit(hatchery)


func _on_temp_wet_selection(hatchery: Hatchery) -> void:
	print("selected temp wet hatchery")
	selection.emit(hatchery)


func _on_hot_wet_selection(hatchery: Hatchery) -> void:
	print("selected hot wet hatchery")
	selection.emit(hatchery)

func _load():
	var cold_dry = $MarginContainer/GridContainer/ColdDry
	var cold_wet = $MarginContainer/GridContainer/ColdWet
	var temp_dry = $MarginContainer/GridContainer/TempDry
	var temp_wet = $MarginContainer/GridContainer/TempWet
	var hot_dry = $MarginContainer/GridContainer/HotDry
	var hot_wet = $MarginContainer/GridContainer/HotWet
	
	print("-----starting incubator room setup-----")
	
	cold_dry.setup(save.incubator.cold_dry)
	cold_wet.setup(save.incubator.cold_wet)
	temp_dry.setup(save.incubator.temp_dry)
	temp_wet.setup(save.incubator.temp_wet)
	hot_dry.setup(save.incubator.hot_dry)
	hot_wet.setup(save.incubator.hot_wet)
	
	print("-----incubator room setup complete-----")
