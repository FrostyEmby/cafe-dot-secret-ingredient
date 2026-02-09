extends Control

var save : Save = load("res://resources/save.tres")

func _on_play_pressed() -> void:
	# goes to intro scene
	get_tree().change_scene_to_file("uid://cgs2egubd3560")


func _on_settings_pressed() -> void:
	get_tree().change_scene_to_file("uid://bgagifdev40yk")


func _on_credits_pressed() -> void:
	get_tree().change_scene_to_file("uid://d2ptf51hotg12")


# loop the music
func _on_music_finished() -> void:
	$Music.play()
