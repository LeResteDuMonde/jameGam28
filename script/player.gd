extends CharacterBody2D

const Speed = 300.0
const MaxSpeed = 500.0
const Acceleration = 5000.0
const Deceleration = 8000.0
const MinVelocity = 10.0

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

	move_and_slide()
