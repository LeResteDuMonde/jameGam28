extends dragable

var timer = 2 #seconds
var impact
var explosion

func _ready():
	init()
	impact = $Impact
	explosion =  load("res://scene/explosion.tscn")
	
func _process(delta):
	move(delta)
	
	if(active): timer -= delta
	if(timer < 0): explode()
	
func explode():
	var e = explosion.instantiate()
	e.global_position = global_position
	get_tree().get_root().add_child(e)
	e.explode()
	
	var nodes = impact.get_overlapping_bodies()
	for n in nodes:
#		print(n)
		if(n.name == "Enemy"): n.queue_free()
		
	queue_free()
	



#func _on_impact_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
#	pass # Replace with function body.
