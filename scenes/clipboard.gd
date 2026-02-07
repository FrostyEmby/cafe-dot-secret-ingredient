extends ColorRect

var open_x : int = 882
var close_x : int = 1133
var y : int = 134

var save = load("res://resources/save.tres")


func _ready() -> void:
	$"Notes/Player Writing".text = save.clipboard.text
	position.x = close_x
	position.y = 134


func move():
	var tween = create_tween()
	if save.clipboard.open:
		tween.tween_property(self, "global_position", Vector2(close_x, y), 0.1)
		save.clipboard.open = false
	else:
		save.clipboard.open = true
		tween.tween_property(self, "global_position", Vector2(open_x, y), 0.1)


func _on_move_pressed() -> void:
	move()


func _on_player_writing_text_changed() -> void:
	save.clipboard.text = $"Notes/Player Writing".text
