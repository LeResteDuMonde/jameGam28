extends Node2D

var nextSpawn=0
var bomb
var walls
var animation
# Called when the node enters the scene tree for the first time.
func _ready():
	animation = $AnimatedSprite2D
	bomb = load("res://scene/bomb.tscn")
	walls = [load("res://scene/wall_is.tscn")]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var current = Time.get_ticks_msec()
	if current > nextSpawn:
		animation.play("open")
		
		var r_int = randi_range(0,2)
		var d 
		if r_int == 0 : d = bomb.instantiate()
		else : d = walls[0].instantiate()
			
#		get_node("../").add_child(b)
		
		add_child(d)
#		b.global_position = global_position + Vector2(-15,0)
		d.position = Vector2(-15,0)
#		
		
		nextSpawn = current + spawnTime(current,get_child_count())
	pass

#setup the difficulty here
func spawnTime(timeFromBeginingOfGame, numberOfEnemy):
	return 1000*randf_range(5,15)#TODO make it evolve to make the game harder with time


func _on_animated_sprite_2d_animation_finished():
	animation.play("default")
