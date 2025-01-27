extends State

@export var retract_state: State
@export var tip: Node2D

## Called when state is first loaded
func _ready() -> void:
	pass

## Called every time state is entered
func _enter(args: Dictionary) -> void:
	pass

## Called every time there is a switch to a new state
func _exit() -> void:
	pass

## State equivalent of _process()
func _update(delta: float) -> void:
	if Input.is_action_just_pressed("throw_lasso"):
		state_machine.change_state_to(retract_state)
	elif Input.is_action_just_pressed("hold_lure"):
		MessageBus.monkey_grappled.emit(tip.position * target.grapple_v_multiplier)
		state_machine.change_state_to(retract_state)

## State equivalent of _physics_process()
func _physics_update(delta: float) -> void:
	pass
