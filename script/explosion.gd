extends Node2D

var animation
var impact

func _ready():
	animation = $animation
	impact = $Impact
	explode()
	
func _process(delta):
	check_area()
	
func check_area():
	var nodes = impact.get_overlapping_bodies()
	for n in nodes:
		if(n.has_method("damage")): n.damage()
	
func explode():
	animation.play("default")

func _on_animation_animation_finished():
	queue_free()
