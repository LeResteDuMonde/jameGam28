extends RigidBody2D
class_name dragable

var sprite
var collisionShape

var selected = false
var active = false

func _ready():
	init()
#	print_debug("bomb created")

func _process(delta):
	move(delta)

func init():
	sprite = $Sprite
	collisionShape = $CollisionShape2D
	collisionShape.disabled = false
	input_event.connect(m_input_event)
	
func test(a,b,c):
		print_debug("input_event")
	
func move(delta):
	if selected: 
#		print_debug("move")
		global_position = lerp(global_position, get_global_mouse_position(), 15 * delta)
		if !CM.selecting :
			unselect()
	return

func m_input_event(viewport, event, shape_idx):
#	print_debug("input event")
	if Input.is_action_just_pressed("click") && !CM.selecting:
		select()
	
		
func select():
	collisionShape.disabled = true
	CM.selecting = true
	selected = true
	sprite.z_index = 1
	
func unselect():
	collisionShape.disabled = false
	selected = false
	sprite.z_index = 0
	active = true
	CM.selecting = false
