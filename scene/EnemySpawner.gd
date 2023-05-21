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
	var baseTime = 1000*randf_range(5,15)
	var decrease = log(timeFromBeginingOfGame / 1000 + 1)
	print(decrease)
	return baseTime/decrease
