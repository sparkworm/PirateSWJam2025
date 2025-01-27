## Allows the monkey to swing from a defined point, that being the end of the 
## lasso when attached
class_name SwingState
extends State

@export var character: CharacterBody2D

@export var gravity: float = 250

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
	character.velocity.y += gravity * delta
	
	character.move_and_slide()
