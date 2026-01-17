extends Control

@onready var music_volume : Label = $"PanelContainer/MarginContainer/GridContainer/Volume Display"
@onready var sound_volume : Label = $"PanelContainer/MarginContainer/GridContainer/Sound Display"

func _on_music_volume_value_changed(value: float) -> void:
	music_volume.text = str(value) + "%"
	AudioServer.set_bus_volume_linear(0, value)


func _on_sound_volume_value_changed(value: float) -> void:
	sound_volume.text = str(value) + "%"
	AudioServer.set_bus_volume_linear(1, value)

func _on_back_pressed() -> void:
	# go back to main menu
	get_tree().change_scene_to_file("uid://dhs6v4k8dmjo4")
