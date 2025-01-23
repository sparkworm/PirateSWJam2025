extends State

@export var launch_state: State

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
	if Input.is_action_just_pressed("throw_lasso"):
		state_machine.change_state_to(launch_state)

## State equivalent of _physics_process()
func _physics_update(_delta: float) -> void:
	pass
