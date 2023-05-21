extends dragable
class_name Wall
var hp=100
var looseHpSpeed = 50
var label="wall"

func looseHp(delta):
	print_debug("loose hp, current hp :  %d"% hp)
	hp-=delta*looseHpSpeed
	if hp<0:
		queue_free()
# Called when the node enters the scene tree for the first time.
func _ready():
	super._ready()

func damage():
	queue_free()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	super._process(delta)
