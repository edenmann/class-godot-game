extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const acceleration = 50


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("move_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		#velocity.x = direction * SPEED
		velocity.x += direction * acceleration * 1.2
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	if velocity.x > 350 or velocity.x < -350:
		velocity.x = 350 * direction

	move_and_slide()
