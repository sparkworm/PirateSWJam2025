class_name LuredFallState
extends State

@export var player: CharacterBody2D
@export var fall_state: State
@export var grounded_state: State

var lure: Node2D

## Called when state is first loaded
func _ready() -> void:
	pass

## Called every time state is entered
func _enter(args: Dictionary) -> void:
	lure = args["lure"]
	MessageBus.lure_retracted.connect(Callable(self, "handle_retraction"))

## Called every time there is a switch to a new state
func _exit() -> void:
	MessageBus.lure_retracted.disconnect(Callable(self, "handle_retraction"))

## State equivalent of _process()
func _update(_delta: float) -> void:
	if player.is_on_floor():
		state_machine.change_state_to(grounded_state)

## State equivalent of _physics_process()
func _physics_update(delta: float) -> void:
	if player.velocity.x != 0:
		var sign = player.velocity.x / abs(player.velocity.x)
		player.velocity.x = max(0,abs(player.velocity.x) - 
				player.air_drag * delta) * sign
		print(player.velocity)
	if abs(lure.position.x) > player.lure_deadzone:
		var lure_direction: int = lure.position.x / abs(lure.position.x)
		player.velocity.x += player.air_acceleration * lure_direction * delta
	player.velocity += player.get_gravity() * delta
	player.move_and_slide()

func handle_retraction(_lure: Node2D) -> void:
	state_machine.change_state_to(fall_state)
