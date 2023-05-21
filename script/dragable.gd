extends StaticBody2D
class_name dragable

var sprite
var collisionShape

var selected = false
var active = false

func _ready():
	init()

func _process(delta):
	move(delta)

func init():
	sprite = $Sprite2D
	collisionShape = $CollisionShape2D
	collisionShape.disabled = false

func move(delta):
	selected
	if selected: global_position = lerp(global_position, get_global_mouse_position(), 25 * delta)

func _on_area_2d_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click") && !CM.selecting:
		select()
	else: if Input.is_action_just_released("click") && selected:
		unselect()
		
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
