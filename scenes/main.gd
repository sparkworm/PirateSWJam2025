## The highest node in the project.  Responsible for holding the active scene,
## as well as switching the active scene.
class_name Main
extends Node

## The first scene the player will see when the game is launched.
@export var starting_scene: PackedScene

## The current active game scene.
var active_scene: GameScene

## Holder of the active scene.
## NOTE: Should only every contain one scene
@onready var active_scene_parent: Node = $ActiveSceneParent

func _ready() -> void:
	# connect signals
	MessageBus.change_scene.connect(Callable(self, "load_scene"))

	if starting_scene != null:
		load_scene(starting_scene)

func load_scene(scene: PackedScene) -> void:
	# Remove active scene.  There shouldn't be more than one, but for-loop
	# is there for flexibility
	# NOTE: may want to move this to seperate function if such an abrupt stop
	# isn't ideal
	for child: Node in active_scene_parent.get_children():
		active_scene_parent.remove_child(child)
	# add scene
	var new_scene: GameScene = scene.instantiate()
	active_scene_parent.add_child(new_scene)
	# set active_scene to be a reference to this new active scene
	active_scene = new_scene
