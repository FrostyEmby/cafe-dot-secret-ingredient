extends MarginContainer

signal selection(hatchery : Hatchery)
signal hatch_select(egg : Egg, hatchery : Hatchery)

@onready var cold_dry = $MarginContainer/GridContainer/Cold_Dry
@onready var cold_wet = $MarginContainer/GridContainer/Cold_Wet
@onready var temp_dry = $MarginContainer/GridContainer/Temp_Dry
@onready var temp_wet = $MarginContainer/GridContainer/Temp_Wet
@onready var hot_dry = $MarginContainer/GridContainer/Hot_Dry
@onready var hot_wet = $MarginContainer/GridContainer/Hot_Wet


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
	print("-----starting incubator room setup-----")
	
	cold_dry.setup()
	cold_wet.setup()
	temp_dry.setup()
	temp_wet.setup()
	hot_dry.setup()
	hot_wet.setup()
	
	print("-----incubator room setup complete-----")


func _on_hatch_select(egg: Egg, hatchery : Hatchery) -> void:
	hatch_select.emit(egg, hatchery)
