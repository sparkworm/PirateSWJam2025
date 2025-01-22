extends Node

enum SceneNames {
	START_MENU,
	TEST_LEVEL,
	LEVEL_1,
	LEVEL_2,
	LEVEL_3,
	LEVEL_4,
	CREDITS,
}

## Array storing all GameScenes.  This prevents circular references and 
## issues with dependencies.
var game_scenes: Dictionary = {
	SceneNames.START_MENU : preload("res://scenes/ui/start_menu.tscn"),
	SceneNames.TEST_LEVEL : preload("res://scenes/levels/test_level.tscn"),
	#SceneNames.LEVEL_1,
	#SceneNames.LEVEL_2,
	#SceneNames.LEVEL_3,
	#SceneNames.LEVEL_4,
	SceneNames.CREDITS : preload("res://scenes/credits.tscn"),
}
