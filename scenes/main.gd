## The highest node in the project.  Responsible for holding the active scene,
## as well as switching the active scene.
class_name Main
extends Node

## The first scene the player will see when the game is launched.
@export var starting_scene: Globals.SceneNames

## The current active game scene.
var active_scene: GameScene

## Holder of the active scene.
## NOTE: Should only every contain one scene
@onready var active_scene_parent: Node = $ActiveSceneParent
@onready var music_player: MusicPlayer = $MusicPlayer

func _ready() -> void:
	# connect signals
	MessageBus.change_scene.connect(Callable(self, "load_scene"))
	MessageBus.game_quit.connect(Callable(self, "quit_game"))
	music_player.play_song(0)

	if starting_scene != null:
		load_scene(starting_scene)

func load_scene(scene_name: Globals.SceneNames) -> void:
	# Remove active scene.  There shouldn't be more than one, but for-loop
	# is there for flexibility
	# NOTE: may want to move this to seperate function if such an abrupt stop
	# isn't ideal
	if not Globals.game_scenes.has(scene_name):
		print("ERROR: scene", scene_name, " does not exist.")
		return

	for child: Node in active_scene_parent.get_children():
		active_scene_parent.call_deferred("remove_child", child)
	# add scene
	var new_scene: GameScene = Globals.game_scenes[scene_name].instantiate()
	active_scene_parent.add_child(new_scene)
	# set active_scene to be a reference to this new active scene
	active_scene = new_scene

## Function for quitting the game.  May eventually have functionality such as
## saving progress
func quit_game() -> void:
	get_tree().quit()
