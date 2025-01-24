extends Node

## Tells Main to switch the active scene to a new one.  Likely called from
## start menu or from completed level.
signal change_scene(new_scene: Globals.SceneNames)

## Signal emitted when the game should be quit
signal game_quit

## signal emitted when a lure is added to the level
signal lure_deployed(lure: Node2D)
## signal emitted when a lure is retracted from the level
signal lure_retracted(lure: Node2D)
