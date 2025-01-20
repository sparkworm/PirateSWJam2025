## Manages one or more states, allowing transition between them.
class_name StateMachine
extends Node

## The node that is actually being controlled by the state machine
@export var target: Node

## The current active state
@export var active_state: State

func _ready() -> void:
	# set the targets of all child states
	for state: State in get_children():
		state.target = target
		state.state_machine = self
	active_state._enter({})

func _process(delta: float) -> void:
	active_state._update(delta)

func _physics_process(delta: float) -> void:
	active_state._physics_update(delta)

## Changes state to specified new state.
## [br] NOTE: states should use a direct reference, meaning they will need
## export variables to define behavior changes
func change_state_to(new_state: State, args:={}) -> void:
	active_state._exit()
	active_state = new_state
	print("Changing state to ", new_state.name)
	active_state._enter(args)
