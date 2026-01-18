extends TextureButton
class_name Egg

var draggable : bool = false
var offset : Vector2 = Vector2(0,0)

func _pressed() -> void:
	draggable = true
	offset = get_global_mouse_position() - global_position
	
func _process(_delta: float) -> void:
	if draggable and Input.is_action_pressed("drop"):
		draggable = false
		
	if draggable:
		position = get_global_mouse_position() - offset
