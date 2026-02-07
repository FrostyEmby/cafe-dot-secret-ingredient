extends PanelContainer

signal pause
signal play

var active : bool = false

func _ready():
	play.emit()
	active = false
	visible = false
	$Music.stop()


func _process(_delta: float) -> void:
	if not active and Input.is_action_just_pressed("pause"):
		active = true
		pause.emit()
		visible = true
		$Music.play()
	elif active and Input.is_action_just_pressed("pause"):
		active = false
		play.emit()
		visible = false
		$Music.stop()


func _on_back_pressed() -> void:
	play.emit()
	visible = false
	$Music.stop()


func _on_settings_pressed() -> void:
	$Options.visible = false
	$Settings.visible = true


func _on_main_menu_pressed() -> void:
	# go back to main menu
	get_tree().change_scene_to_file("uid://dhs6v4k8dmjo4")


func _on_settings_off() -> void:
	$Options.visible = true
	$Settings.visible = false


func _on_music_finished() -> void:
	if active:
		$Music.play()
