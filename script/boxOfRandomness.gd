extends Node2D

var nextSpawn=0
var bomb
var walls = []
var animation
var tmp = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	animation = $AnimatedSprite2D
	bomb = load("res://scene/bomb.tscn")
	
	var wallTypes = ["is","ib","L","T"]

	for t in wallTypes:
		walls.append(load("res://scene/wall_"+t+".tscn"))
	
	print(walls)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var current = Time.get_ticks_msec()
	if current > nextSpawn:
		animation.play("open")
		
		var r_int = randi_range(0,2)
		var d 
		if r_int == 0 : d = bomb.instantiate()
		else : 
			d = walls.pick_random().instantiate()
			var rotDeg = randi_range(0,360)
			var rotRad = deg_to_rad(rotDeg)
			var rot = round(rotRad/ deg_to_rad(90)) * rotRad
			d.rotation = rot
		add_child(d)
#		b.global_position = global_position + Vector2(-15,0)
		d.position = Vector2(-15,0)
#		
	
		#b.apply_impulse(Vector2(0,-15))
		nextSpawn = current + spawnTime(current,get_child_count())
	pass

#setup the difficulty here
func spawnTime(timeFromBeginingOfGame, numberOfEnemy):
	return 300*randf_range(5,15)#TODO make it evolve to make the game harder with time


func _on_animated_sprite_2d_animation_finished():
	animation.play("default")
