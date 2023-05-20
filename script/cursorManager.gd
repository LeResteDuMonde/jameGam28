extends Node

var selecting = false

func _input(event):
	if Input.is_action_just_released("click"):
		selecting = false
