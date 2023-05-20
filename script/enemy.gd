extends CharacterBody2D

var Target

const Speed = 200.0
const MaxSpeed = 300.0
const Acceleration = 5000.0
const Deceleration = 8000.0
const MinVelocity = 10.0

func _ready():
	var gameManager = $"../GameManager"
	Target = gameManager.Player

func _physics_process(delta):
	var direction = Vector2.ZERO
	# var velocity = get_velocity()

	if Target != null:
		var targetPos = Target.global_position
		direction = position.direction_to(targetPos)
		velocity += direction * Acceleration * delta
		velocity = velocity.limit_length(MaxSpeed)
	else:
		var decelerationAmount = Deceleration * delta
		var currentSpeed = velocity.length()
		if currentSpeed > MinVelocity:
			var newSpeed = max(currentSpeed - decelerationAmount, 0.0)
			velocity = velocity.normalized() * newSpeed
		else:
			velocity = Vector2.ZERO

	# set_velocity(velocity)
	move_and_slide()
