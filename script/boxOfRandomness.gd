extends Node2D

var nextSpawn
var bomb = preload("res://scene/bomb.tscn")
var walls = []
var animation
var tmp = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	
	nextSpawn = Time.get_ticks_msec() + 1000
	animation = $AnimatedSprite2D
	animation.play("default")
	
	var wallTypes = ["is","ib","L","T"]

	for t in wallTypes:
		walls.append(load("res://scene/wall_"+t+".tscn"))
	
	print(walls)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var current = Time.get_ticks_msec()
	if current > nextSpawn:
		spawnItem(current)

func spawnItem(time):
	animation.play("open")
	AM.play("chest")
	var r_int = randi_range(0,2)
	var d 
	if r_int == 0 : d = bomb.instantiate()
	else : 
		var wall = walls.pick_random()
		d = wall.instantiate()
		var rotDeg = randi_range(0,3) * 90
		var rotRad = deg_to_rad(rotDeg)
		var rot = round(rotRad/ deg_to_rad(90)) * rotRad
		d.rotation = rot
	add_child(d)
	d.position = Vector2(-15,0)
	nextSpawn = time + spawnTime(time,get_child_count())
	
#setup the difficulty here
func spawnTime(timeFromBeginingOfGame, numberOfEnemy):
#	return 1000*randf_range(5,15)*0.4#TODO make it evolve to make the game harder with time
	var baseTime = 1000 * randf_range(8,15)
	var decrease = log(timeFromBeginingOfGame / 1000 + 1.1)
#	print(decrease)
	return baseTime/decrease

func _on_animated_sprite_2d_animation_finished():
	animation.play("default")
