extends Panel


func _on_home_pressed() -> void:
	print("switch to gathering")
	get_tree().change_scene_to_file("uid://g28updgkaqym")


func _on_incubator_pressed() -> void:
	print("switch to incubators")
	get_tree().change_scene_to_file("uid://csy6oy6sctiow")


func _on_terrarium_pressed() -> void:
	print("switch to terrariums")
	get_tree().change_scene_to_file("uid://77pmhayrj8nl")


func _on_bestiary_pressed() -> void:
	print("switch to bestiary")
	get_tree().change_scene_to_file("uid://puey23wcodsh")


func _on_settings_pressed() -> void:
	print("switch to settings")
	get_tree().change_scene_to_file("uid://cpbueqxv0uum2")
