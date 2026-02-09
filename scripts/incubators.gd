extends MarginContainer

signal selection(hatchery : Hatchery)
signal hatch_select(egg : Egg, hatchery : Hatchery)

var active_prev : bool = true # this is to check for changes in active state
@export var active : bool = true

@onready var cold_dry = $MarginContainer/GridContainer/Cold_Dry
@onready var cold_wet = $MarginContainer/GridContainer/Cold_Wet
@onready var temp_dry = $MarginContainer/GridContainer/Temp_Dry
@onready var temp_wet = $MarginContainer/GridContainer/Temp_Wet
@onready var hot_dry = $MarginContainer/GridContainer/Hot_Dry
@onready var hot_wet = $MarginContainer/GridContainer/Hot_Wet

# to pause/unpause
func _process(_delta: float) -> void:
	# if active changes
	if active != active_prev:
		cold_dry.active = active
		temp_dry.active = active
		hot_dry.active = active
		cold_wet.active = active
		temp_wet.active = active
		hot_wet.active = active
		active_prev = active

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


func _on_hatch_select(egg: Egg, hatchery : Hatchery) -> void:
	hatch_select.emit(egg, hatchery)
