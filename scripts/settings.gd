extends Control

@onready var music = $"PanelContainer/MarginContainer/GridContainer/Music Volume"
@onready var sound = $"PanelContainer/MarginContainer/GridContainer/Sound Volume"
@onready var display = $"PanelContainer/MarginContainer/GridContainer/Display Options"

func _ready() -> void:
	music.value = AudioServer.get_bus_volume_linear(0)
	sound.value = AudioServer.get_bus_volume_linear(1)
	
	if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN:
		display.selected = 1
	else:
		display.selected = 0


func _on_master_volume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_linear(0, value)


func _on_sound_volume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_linear(1, value)


func _on_back_pressed() -> void:
	# go back to main menu
	get_tree().change_scene_to_file("uid://dhs6v4k8dmjo4")


func _on_music_finished() -> void:
	$Music.play()


func _on_display_options_item_selected(index: int) -> void:
	if index == 1:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
