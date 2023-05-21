extends Node

var Player
var root
var main
var main_r = preload("res://scene/main.tscn")
var gameOverSprite

func _ready():
	root = get_tree().root
	main = root.get_node("Main")
	start()
	
func start():
	Player = main.get_node("Player")
	gameOverSprite = main.get_node("GameOver")
	AM.play("start")

func playerDies():
	AM.play("gameover")
	Player.queue_free()
	gameOverSprite.visible = true

func _input(event):
	if Input.is_action_just_released("escape"):
		get_tree().quit()
	
	if Input.is_action_just_released("enter"):
		main.queue_free()
		main = main_r.instantiate()
		root.add_child(main)
		start()
