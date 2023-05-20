extends Node

var speed = 0.4
var area

var animation

func _ready():
	area = $Area2D
	animation = $AnimatedSprite2D
	animation.play("default")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var nodes = area.get_overlapping_bodies()
#	print(nodes.size)
	for n in nodes:
		# print(n.name)
		if(n.position != null): 
			n.position.x -= speed
