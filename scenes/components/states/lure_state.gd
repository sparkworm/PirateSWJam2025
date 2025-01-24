class_name LureState
extends State

@export var lasso: Lasso
## The tip, which will also function as the lure in this state
@export var tip: Node2D

@export var idle_state: State

## Called when state is first loaded
func _ready() -> void:
	pass

## Called every time state is entered
func _enter(_args: Dictionary) -> void:
	MessageBus.lure_deployed.emit(tip)

## Called every time there is a switch to a new state
func _exit() -> void:
	tip.position = Vector2.ZERO
	lasso.update_end_point()
	MessageBus.lure_retracted.emit(tip)

## State equivalent of _process()
func _update(_delta: float) -> void:
	if Input.is_action_just_released("hold_lure"):
		state_machine.change_state_to(idle_state)

## State equivalent of _physics_process()
func _physics_update(_delta: float) -> void:
	tip.global_position = tip.get_global_mouse_position()
	lasso.update_end_point()
