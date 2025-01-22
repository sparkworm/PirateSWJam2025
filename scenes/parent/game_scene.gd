## Abstract class for all game scenes, such as level or main menu.
class_name GameScene
extends Node2D

func _ready() -> void:
	enter_transition()

## Creates intro fade or other effects
func enter_transition() -> void:
	pass

## Creates exit fade or other effects, then calls a transition to the next level
func exit_transition(next_level: Globals.SceneNames) -> void:
	MessageBus.change_scene.emit(next_level)
