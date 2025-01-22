## Parent class for an individual state in the state machine.  Maintains control
## until it switches to another state.
extends State

func _enter(args: Dictionary) -> void:
	pass

func _exit() -> void:
	pass

## State equivalent of _process()
func _update(delta: float) -> void:
	pass

## State equivalent of _physics_process()
func _physics_update(delta: float) -> void:
	pass
