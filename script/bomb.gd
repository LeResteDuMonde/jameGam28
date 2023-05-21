extends dragable

var timer = 2 #seconds
var explosion
var hasExploded = false
func _ready():
	init()
	explosion =  load("res://scene/explosion.tscn")
	
func _process(delta):
	move(delta)
	
	if(active): timer -= delta	
	if timer < 0 and hasExploded == false :
		explode()
	
func explode():
	hasExploded = true
	var e = explosion.instantiate()
	e.global_position = global_position
	get_tree().get_root().add_child(e)
	
	queue_free()
