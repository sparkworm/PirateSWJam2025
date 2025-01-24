class_name MonkeyIdleState
extends State

@export var lured_state: State

## Called when state is first loaded
func _ready() -> void:
	pass

## Called every time state is entered
func _enter(_args: Dictionary) -> void:
	MessageBus.lure_deployed.connect(Callable(self, "handle_lure"))

## Called every time there is a switch to a new state
func _exit() -> void:
	MessageBus.lure_deployed.disconnect(Callable(self, "handle_lure"))

## State equivalent of _process()
func _update(_delta: float) -> void:
	pass

## State equivalent of _physics_process()
func _physics_update(_delta: float) -> void:
	pass

func handle_lure(lure: Node2D) -> void:
	state_machine.change_state_to(lured_state, {"lure":lure})
