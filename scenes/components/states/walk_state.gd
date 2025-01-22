## State for characters walking accross a horizontal surface.
class_name WalkState
extends State

@export_group("States")
@export var fall_state: State
@export var jump_state: State
@export var punch_state: State
@export_group("Detection")
@export var edge_detect_r: Area2D
@export var edge_detect_l: Area2D
@export var punch_detect_r: Area2D
@export var punch_detect_l: Area2D


## The direction that the character is moving.  Either -1 or 1.
var direction: int = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func _enter(_args:={}) -> void:
	target.velocity.x = target.walk_speed
	edge_detect_r.body_exited.connect(Callable(self, "handle_edge"))
	edge_detect_l.body_exited.connect(Callable(self, "handle_edge"))
	punch_detect_r.body_entered.connect(Callable(self, "handle_punch"))
	punch_detect_l.body_entered.connect(Callable(self, "handle_punch"))


func _exit() -> void:
	edge_detect_r.body_exited.disconnect(Callable(self, "handle_edge"))
	edge_detect_l.body_exited.disconnect(Callable(self, "handle_edge"))
	punch_detect_r.body_entered.disconnect(Callable(self, "handle_punch"))
	punch_detect_l.body_entered.disconnect(Callable(self, "handle_punch"))

## State equivalent of _process()
func _update(delta: float) -> void:
	target = target as CharacterBody2D
	# if somehow in air, fall
	if not target.is_on_floor():
		state_machine.change_state_to(fall_state)


## State equivalent of _physics_process()
func _physics_update(_delta: float) -> void:
	target = target as CharacterBody2D
	target.move_and_slide()
	# if the character bumps into the wall, change the direction of walking
	if target.is_on_wall():
		flip_direction()

## When one of the edge detectors no longer sees ground, turn around
func handle_edge(_body: Node2D) -> void:
	flip_direction()

func handle_punch(body: Node2D) -> void:
	state_machine.change_state_to(punch_state, {"body":body})

## Changes the direction and restores velocity
func flip_direction() -> void:
	direction *= -1
	target.velocity.x = target.walk_speed * direction
