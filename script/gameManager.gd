extends Node

var Player
var root

func _ready():
	root = get_tree().root
	Player = root.get_node("Main/Player")
