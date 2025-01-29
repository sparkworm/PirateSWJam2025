## Parent class for an individual state in the state machine.  Maintains control
## until it switches to another state.
class_name FallState
extends State

@export var grounded_state: State
@export var lured_fall_state: State

func _enter(_args: Dictionary) -> void:
	MessageBus.lure_deployed.connect(Callable(self, "handle_lure"))

func _exit() -> void:
	MessageBus.lure_deployed.disconnect(Callable(self, "handle_lure"))

## State equivalent of _process()
func _update(_delta: float) -> void:
	pass

## State equivalent of _physics_process()
func _physics_update(delta: float) -> void:
	target = target as CharacterBody2D

	target.velocity += target.get_gravity() * delta
	target.move_and_slide()
	if target.is_on_floor():
		state_machine.change_state_to(grounded_state)

func handle_lure(lure: Node2D) -> void:
	state_machine.change_state_to(lured_fall_state, {"lure":lure})
