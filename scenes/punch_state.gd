class_name PunchState
extends State

@export var walk_state: State

## Called when state is first loaded
func _ready() -> void:
	pass

## Called every time state is entered
func _enter(args: Dictionary) -> void:
	# should probably play an animation
	var body: Node2D = args["body"]
	body.queue_free()
	state_machine.change_state_to(walk_state)

## Called every time there is a switch to a new state
func _exit() -> void:
	pass

## State equivalent of _process()
func _update(delta: float) -> void:
	pass

## State equivalent of _physics_process()
func _physics_update(delta: float) -> void:
	pass
