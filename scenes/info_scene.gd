## Class for displaying info as a gamescene.  An example could be the credits
## or a startup tutorial.  Can transition to another scene.
class_name InfoScene
extends GameScene

@export var next_scene: PackedScene

func _process(_delta: float) -> void:
	# change to next scene if the player accepts
	if Input.is_action_just_pressed("ui_accept"):
		MessageBus.change_scene.emit(next_scene)
