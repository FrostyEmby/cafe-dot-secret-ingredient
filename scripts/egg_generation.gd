extends Timer
var save : Save = load("res://resources/save.tres")

func timeout():
	save.egg_fill = true
