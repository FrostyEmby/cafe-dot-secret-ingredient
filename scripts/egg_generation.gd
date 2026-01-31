extends Timer
var save : Save = load("res://resources/save.tres")

func timeout():
	print("egg fill active")
	save.egg_fill = true
