extends CharacterBody2D

class_name Player

const SPEED = 400.0
const JUMP_VELOCITY = -900.0
@onready var sprite_2d: AnimatedSprite2D = $Sprite2D
@onready var coyote_timer = $CoyoteTimer


func _physics_process(delta: float) -> void:
	# Animations
	if (velocity.x > 1 || velocity.x < -1):
		sprite_2d.animation = "running"
	else:
		sprite_2d.animation = "default"
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		sprite_2d.animation = "jumping"

	# Handle jump.
	if Input.is_action_just_pressed("jump") and (is_on_floor() || !coyote_timer.is_stopped()):
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 100)
	
	var was_on_floor = is_on_floor()
	move_and_slide()
	
	if was_on_floor && !is_on_floor():
		coyote_timer.start()
	
	
	# check if moving left, if so change sprite to look left
	var isLeft = velocity.x < 0
	sprite_2d.flip_h = isLeft
