extends Control


func _on_next_pressed() -> void:
	get_tree().change_scene_to_file("uid://g28updgkaqym")


func _on_music_finished() -> void:
	$Music.play()
