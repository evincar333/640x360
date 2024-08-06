extends CharacterBody2D

# Speed of the player movement
@export var speed = 300
@onready var sprite_2d = $Sprite2D

# Define the playing area boundaries
@export var top_boundary = 2
@export var bottom_boundary = 358

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Create a vector to store the player's movement direction
	var direction = Vector2.ZERO
	
	# Check for input and set the direction accordingly
	if Input.is_action_pressed("up"):
		direction.y -= 1
	if Input.is_action_pressed("down"):
		direction.y += 1
	if Input.is_action_pressed("left"):
		direction.x -= 1
	if Input.is_action_pressed("right"):
		direction.x += 1
	
	# Normalize the direction vector to ensure consistent speed in all directions
	if direction != Vector2.ZERO:
		direction = direction.normalized()

	# Flip Sprite
	#if direction.x < 0:
		#sprite_2d.flip_h = true
	#elif direction.x > 0:
		#sprite_2d.flip_h = false

	# Apply movement
	velocity = direction * speed
	
	# Move the player
	move_and_slide()

	# Ensure the player stays within the vertical boundaries
	if position.y < top_boundary:
		position.y = top_boundary
	elif position.y > bottom_boundary:
		position.y = bottom_boundary





