## State for characters walking accross a horizontal surface.
class_name WalkState
extends State

@export var fall_state: State
@export var jump_state: State
@export var edge_detect_r: Area2D
@export var edge_detect_l: Area2D

## The direction that the character is moving.  Either -1 or 1.
var direction: int = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	edge_detect_l.area_exited.connect(Callable(self, "flip_direction"))
	edge_detect_r.area_exited.connect(Callable(self, "flip_direction"))

func _enter(args:={}) -> void:
	target.velocity.x = target.walk_speed

func _exit() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	target = target as CharacterBody2D
	target.move_and_slide()
	## if the character bumps into the wall, change the direction of walking
	if target.is_on_wall():
		direction *= -1
		target.velocity.x *= direction

func flip_direction() -> void:
	direction *= -1
