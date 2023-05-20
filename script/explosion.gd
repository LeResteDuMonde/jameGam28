extends Node2D

var animation
var impact

func _ready():
	animation = $animation
	impact = $Impact
	
func explode():
	animation.play("default")
	
#	var nodes = impact.get_overlapping_bodies()
#	for n in nodes:
#		print(n)
#		if(n.name == "Enemy"): n.queue_free()
#		pass

func _on_animation_animation_finished():
	queue_free()
