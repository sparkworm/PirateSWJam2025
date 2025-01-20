## The menu that the player will be greeted with when opening the game
class_name StartMenu
extends GameScene


func _on_start_button_pressed() -> void:
	## Change scene to the first level
	MessageBus.change_scene.emit(Globals.levels[0])

func _on_options_button_pressed() -> void:
	pass # Replace with function body.

func _on_quit_button_pressed() -> void:
	MessageBus.game_quit.emit()
