extends Control

@onready var music = $"PanelContainer/MarginContainer/GridContainer/Music Volume"
@onready var sound = $"PanelContainer/MarginContainer/GridContainer/Sound Volume"

func _ready() -> void:
	music.value = AudioServer.get_bus_volume_linear(0)
	sound.value = AudioServer.get_bus_volume_linear(1)


func _on_master_volume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_linear(0, value)


func _on_sound_volume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_linear(1, value)

func _on_back_pressed() -> void:
	# go back to main menu
	get_tree().change_scene_to_file("uid://dhs6v4k8dmjo4")
