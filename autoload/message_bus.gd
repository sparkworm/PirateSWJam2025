extends Node

## Tells Main to switch the active scene to a new one.  Likely called from
## start menu or from completed level.
signal change_scene(new_scene: PackedScene)

signal game_quit
