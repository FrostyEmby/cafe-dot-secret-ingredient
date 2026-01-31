extends Control

@onready var menu = $"Mini Menu/HBoxContainer"

func _on_play_pressed() -> void:
	# goes to incubator scene
	$Press.play()
	menu.visible = false
	#await $Press.finished
	get_tree().change_scene_to_file("uid://g28updgkaqym")


func _on_settings_pressed() -> void:
	$Press.play()
	menu.visible = false
	#await $Press.finished
	get_tree().change_scene_to_file("uid://bgagifdev40yk")


func _on_credits_pressed() -> void:
	$Press.play()
	menu.visible = false
	#await $Press.finished
	get_tree().change_scene_to_file("uid://d2ptf51hotg12")


# loop the music
func _on_music_finished() -> void:
	$Music.play()
