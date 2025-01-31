class_name Enemy
extends CharacterBody2D

@export var walk_speed: float = 100
@export var attack_range: float = 100
@export var attack_time: float = 1

var direction_x: int = 1
var direction: float
var attacking: bool = false

@onready var attack_timer: Timer = $AttackTimer
@onready var attack_ray: RayCast2D = $AttackRay

func _ready() -> void:
	attack_timer.wait_time = attack_time
	attack_ray.target_position.x = attack_range

func _process(delta: float) -> void:
	if not attacking:
		if attack_ray.is_colliding():
			charge_attack()

func _physics_process(delta: float) -> void:
	apply_gravity(delta)
	if not attacking:
		movement(delta)

func die() -> void:
	queue_free()

func charge_attack() -> void:
	attacking = true
	attack_timer.start()

func execute_attack() -> void:
	if attack_ray.is_colliding():
		print('killing player')
		MessageBus.player_killed.emit()

func movement(delta: float) -> void:
	# Moving in a direction if on floor
	if is_on_floor():
		direction = direction_x * walk_speed
	else:
		direction = 0

	velocity.x += direction
	move_and_slide()
	velocity.x -= direction # Subtracting direction so player don't build up speed

func apply_gravity(delta: float) -> void:
	# Applying gravity
	if !is_on_floor():
		velocity += get_gravity() * delta

func _on_platform_right_exited(body: Node2D) -> void: # Checking for platform edge on right
	if !is_on_floor(): return
	direction_x = -1
	attack_ray.target_position.x *= -1
	print(attack_ray.target_position)

func _on_platform_left_exited(body: Node2D) -> void: # Checking for platform edge on left
	if !is_on_floor(): return
	direction_x = 1
	attack_ray.target_position.x *= -1
	print(attack_ray.target_position)

func _on_attack_timer_timeout() -> void:
	execute_attack()
	attacking = false
