extends CharacterBody2D
class_name Enemy

var Target 
var gameManager
var animation
const Speed = 20
const MaxSpeed = 30
const Acceleration = 500
const Deceleration = 800
const MinVelocity = 1
var hasInflictedDamage = false

func _ready():
	gameManager = GM
	Target = GM.Player
#	Target = GameManager.getPlayer()
	animation = $AnimatedSprite2D
	animation.play("run")
	
	findAndSetSpawnPosition()

func _physics_process(delta):
	var direction = Vector2.ZERO
	# var velocity = get_velocity()

	if Target != null:
		var targetPos = Target.global_position
		direction = position.direction_to(targetPos)
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
	
	rotateAnimation(direction)
	move_and_slide()
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		var collider = collision.get_collider()
		if collider.name == "Player":
			contactWithPlayer()
			damage()
		elif collider.is_in_group('wall'):
			contactWithWall(collider,delta)
	
func rotateAnimation(direction):
	var rotation = Vector2(-direction[1],direction[0]).angle()
	rotation = round(rotation / deg_to_rad(90)) * deg_to_rad(90)
	animation.rotation = rotation

#to find the spawn position for the enemy
func findAndSetSpawnPosition():
	
	var boundaries = get_viewport_rect().size
	#print(boundaries)
	var minRadius = sqrt( boundaries.x**2+boundaries.y**2)  /2
	var radius = minRadius +  10 #approximate margine (could be calculated with width of monster
	var angle = randf_range(0,2*PI)
	
	var pos = Vector2(cos(angle)*radius, sin(angle)*radius)
	print_debug("new monster at position %d %d" % [pos.x,pos.y] ) 
	transform.origin = pos
	
func contactWithPlayer():
	if not hasInflictedDamage:
		Target.loosePv()
		hasInflictedDamage = true
		
func contactWithWall(wall : Wall,delta):
	wall.looseHp(delta)
	
func damage():
	queue_free()
