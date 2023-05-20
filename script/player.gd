extends CharacterBody2D

const Speed = 30
const MaxSpeed = 50
const Acceleration = 500
const Deceleration = 800
const MinVelocity = 1
var pv = 3

func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "up", "down").normalized()

	# Apply acceleration
	if direction != Vector2.ZERO:
		velocity += direction * Acceleration * delta
		velocity = velocity.limit_length(MaxSpeed)
	# Apply deceleration when no input
	else:
		var decelerationAmount = Deceleration * delta
		var currentSpeed = velocity.length()
		if currentSpeed > MinVelocity:
			var newSpeed = max(currentSpeed - decelerationAmount, 0.0)
			velocity = velocity.normalized() * newSpeed
		else:
			velocity = Vector2.ZERO
			
	replacePayerInViewport()

	move_and_slide()
	
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
	
	
func loosePv():
	pv-=1
	print_debug("loose pv, current pv : %d"%pv)
	
