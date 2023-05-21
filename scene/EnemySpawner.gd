extends Node2D

var nextSpawn=0
var enemy
# Called when the node enters the scene tree for the first time.
func _ready():
	enemy =  load("res://scene/enemy.tscn")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var current = Time.get_ticks_msec()
	if current>nextSpawn:
		add_child(enemy.instantiate())
		nextSpawn = current + spawnTime(current,get_child_count())
	pass

#setup the difficulty here
func spawnTime(timeFromBeginingOfGame, numberOfEnemy):
	return 600*randf_range(5,15)#TODO make it evolve to make the game harder with time
