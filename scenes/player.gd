class_name PlayerMonkey
extends CharacterBody2D

## The min horizontal displacement of the lure for movement to occur
@export var lure_deadzone: float = 10
@export var walk_speed: float  = 300
@export var jump_force: float = 500
@export var air_acceleration: float = 200
@export var air_drag: float = 50
@export var ground_drag: float = 500

var direction_x: int = 1
var direction: float

func _ready() -> void:
	pass
