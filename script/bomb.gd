extends dragable

var timer = 2 #seconds
var explosion
var hasExploded = false
var animation
var activated = false

func _ready():
	super._ready()
	explosion =  load("res://scene/explosion.tscn")
	animation = $Sprite
	
func _process(delta):
	super._process(delta)
	
	if(active):
		if(!activated):
			activated = true
			animation.play("activate")
		timer -= delta
	if timer < 0 and hasExploded == false :
		explode()
	
func explode():
	hasExploded = true
	var e = explosion.instantiate()
	e.global_position = global_position
#	get_tree().get_root().add_child(e)
	GM.main.add_child(e)
	
	queue_free()
