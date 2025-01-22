extends CharacterBody2D

@export var walk_speed: float  = 300
@export var jump_force: float = 500

var direction_x: int = 1
var direction: float

func _ready() -> void:
	pass

func _physics_process(_delta: float) -> void:
	#movement(delta)
	pass
'''
func movement(delta: float) -> void:
	# Applying gravity
	if !is_on_floor():
		velocity += get_gravity() * delta

	# Moving in a direction if on floor
	if is_on_floor():
		direction = direction_x * walk_speed
	else:
		direction = 0

	velocity.x += direction
	move_and_slide()
	velocity.x -= direction # Subtracting direction so player don't build up speed


func _on_platform_right_exited(body: Node2D) -> void: # Checking for platform edge on right
	if !is_on_floor(): return
	direction_x = -1


func _on_platform_left_exited(body: Node2D) -> void: # Checking for platform edge on left
	if !is_on_floor(): return
	direction_x = 1

func _on_punch_left_entered(body: Node2D) -> void: # Checking for enemy on left side
	body.queue_free()


func _on_punch_right_entered(body: Node2D) -> void: # Checking for enemy on right side
	body.queue_free()
'''
