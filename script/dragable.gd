extends StaticBody2D

var cursorManager
var sprite
var selected = false
# Called when the node enters the scene tree for the first time.
func _ready():
	sprite = $Sprite2D
	cursorManager = $"../CursorManager"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if selected:
		global_position = lerp(global_position, get_global_mouse_position(), 25 * delta)


func _on_area_2d_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click") && !cursorManager.selecting:
		cursorManager.selecting = true
		selected = true
		sprite.z_index = 1
		
	if Input.is_action_just_released("click") && selected:
		selected = false
		sprite.z_index = 0 
		
