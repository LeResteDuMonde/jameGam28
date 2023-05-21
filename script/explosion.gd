extends Node2D

var animation
var impact
var hasInflictedDamage = 0
func _ready():
	animation = $animation
	impact = $Impact
	explode()
	hasInflictedDamage = 0
	
func _process(delta):	
	if hasInflictedDamage==1:
		#print_debug("inflicing damage at position %d %d"%[global_position.x,global_position.y])
		check_area()
	hasInflictedDamage += 1


	
	
func check_area():
	var nodes = impact.get_overlapping_bodies()
	print_debug(nodes)
	for n in nodes:
		if(n.has_method("damage")): n.damage()
	
func explode():
	animation.play("default")

func _on_animation_animation_finished():
	queue_free()
