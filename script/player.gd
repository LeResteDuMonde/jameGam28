extends CharacterBody2D
var animation

const Speed = 30
const MaxSpeed = 50
const Acceleration = 500
const Deceleration = 800
const MinVelocity = 1
const blood_r = preload("res://scene/blood.tscn")
var pv = 3

func _ready():
	animation = $AnimatedSprite2D
	animation.play("default")
	
func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "up", "down").normalized()

	# Apply acceleration
	if direction != Vector2.ZERO:
		velocity += direction * Acceleration * delta
		velocity = velocity.limit_length(MaxSpeed)
		animation.play("run")
		rotateAnimation(direction)
	# Apply deceleration when no input
	else:
		animation.play("default")
		var decelerationAmount = Deceleration * delta
		var currentSpeed = velocity.length()
		if currentSpeed > MinVelocity:
			var newSpeed = max(currentSpeed - decelerationAmount, 0.0)
			velocity = velocity.normalized() * newSpeed
		else:
			velocity = Vector2.ZERO
	
	replacePayerInViewport()

	move_and_slide()
	
func rotateAnimation(direction):
	var rotationAnim = Vector2(-direction[1],direction[0]).angle()
	rotationAnim = round(rotationAnim / deg_to_rad(90)) * deg_to_rad(90)
	animation.rotation = rotationAnim
	
func replacePayerInViewport():
	var viewport = get_viewport_rect().size
	var bounce = 30
	if transform.origin.x<-viewport.x/2:
		velocity.x = -viewport.x/2-transform.origin.x+bounce
	if transform.origin.x>viewport.x/2 :
		velocity.x = -viewport.x/2+transform.origin.x-bounce
		
	if transform.origin.y<-viewport.y/2:
		velocity.y = -viewport.y/2-transform.origin.y+bounce
	if transform.origin.y>viewport.x/2 :
		velocity.y = -viewport.y/2+transform.origin.y-bounce
		

		
	#print(velocity)
func damage():
	var b = blood_r.instantiate()
	print(b)
	b.global_position = global_position
	b.emitting = true
	GM.main.add_child(b)
	loosePv()
	
func loosePv():
	pv-=1
	print_debug("loose pv, current pv : %d"%pv)
	if pv <= 0:
		GM.playerDies()
