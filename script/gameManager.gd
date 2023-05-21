extends Node

var instance
@export var Player: Node2D

func _ready():
	if instance == null: instance = self

func playerDies():
	print_debug("player is dead")
	#TODO end of the game
