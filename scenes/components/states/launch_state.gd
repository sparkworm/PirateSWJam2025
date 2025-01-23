class_name LaunchState
extends State

var tip_velocity: Vector2

@export var attached_state: State

@export var lasso: Lasso
@export var tip: Area2D

## Called when state is first loaded
func _ready() -> void:
	pass

## Called every time state is entered
func _enter(args: Dictionary) -> void:
	tip_velocity = lasso.get_local_mouse_position()*lasso.launch_speed
	tip.body_entered.connect(Callable(self, "handle_collision"))

## Called every time there is a switch to a new state
func _exit() -> void:
	pass

## State equivalent of _process()
func _update(delta: float) -> void:
	pass

## State equivalent of _physics_process()
func _physics_update(delta: float) -> void:
	tip.position += tip_velocity * delta
	if tip.position.length() > lasso.max_length:
		tip.position = tip.position.normalized() * lasso.max_length
		tip_velocity = Vector2.ZERO
	lasso.update_end_point()
	tip_velocity.y += lasso.gravity * delta

func handle_collision(body: Node2D) -> void:
	if body.is_in_group("enemy"):
		pass # handle what happens if an enemy is lassoed
	state_machine.change_state_to(attached_state)
