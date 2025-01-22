## Parent class for an individual state in the state machine.  Maintains control
## until it switches to another state.
class_name FallState
extends State

@export var grounded_state: State

func _enter(args: Dictionary) -> void:
	pass

func _exit() -> void:
	pass

## State equivalent of _process()
func _update(delta: float) -> void:
	pass

## State equivalent of _physics_process()
func _physics_update(delta: float) -> void:
	target = target as CharacterBody2D
	if not target.is_on_floor():
		state_machine.change_state_to(grounded_state)
	target.velocity += target.get_gravity() * delta
