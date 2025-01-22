## Causes a transition to a specified scene when entered by the player.
class_name TransitionArea
extends Area2D

@export var current_level: Level
@export var next_level: Globals.SceneNames

func _on_body_entered(_body: Node2D) -> void:
	current_level.exit_transition(next_level)
