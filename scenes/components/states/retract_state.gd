## Retracts the tip of the lasso back to the monkey.  Once it arrives, state
## changes to unthrown state
class_name RetractState
extends State

@export var lasso: Lasso
@export var unthrown_state: State
@export var tip: Node2D
@export var retracted_radius: float = 5
## Called when state is first loaded
func _ready() -> void:
	pass

## Called every time state is entered
func _enter(_args: Dictionary) -> void:
	pass

## Called every time there is a switch to a new state
func _exit() -> void:
	pass

## State equivalent of _process()
func _update(_delta: float) -> void:
	pass

## State equivalent of _physics_process()
func _physics_update(delta: float) -> void:
	tip.position = tip.position.normalized() * max(0,
			tip.position.length() - lasso.retract_speed * delta)
	lasso.update_end_point()
	if tip.position.length() <= retracted_radius:
		state_machine.change_state_to(unthrown_state)
