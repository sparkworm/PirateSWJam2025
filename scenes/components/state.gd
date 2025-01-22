## Parent class for an individual state in the state machine.  Maintains control
## until it switches to another state.
class_name State
extends Node

## The node actually being controlled
var target: Node
## The state machine controlling this state
var state_machine: StateMachine

func _enter(_args: Dictionary) -> void:
	pass

func _exit() -> void:
	pass

## State equivalent of _process()
func _update(_delta: float) -> void:
	pass

## State equivalent of _physics_process()
func _physics_update(_delta: float) -> void:
	pass
