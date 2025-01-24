class_name LuredState
extends State

@export var idle_state: State
@export var fall_state: State
@export var player: PlayerMonkey

## The lure that the monkeys are following
var lure: Node2D

## Called when state is first loaded
func _ready() -> void:
	pass

## Called every time state is entered
func _enter(args: Dictionary) -> void:
	MessageBus.lure_retracted.connect(Callable(self, "handle_lure_retraction"))
	lure = args["lure"]

## Called every time there is a switch to a new state
func _exit() -> void:
	MessageBus.lure_retracted.disconnect(Callable(self, "handle_lure_retraction"))

## State equivalent of _process()
func _update(_delta: float) -> void:
	pass

## State equivalent of _physics_process()
func _physics_update(_delta: float) -> void:
	if abs(lure.position.x) > player.lure_deadzone:
		var lure_direction: int = lure.position.x / abs(lure.position.x)
		player.velocity.x = player.walk_speed * lure_direction
	else: 
		player.velocity.x = 0
	player.move_and_slide()
	if not player.is_on_floor():
		state_machine.change_state_to(fall_state)

func handle_lure_retraction(_lure: Node2D) -> void:
	state_machine.change_state_to(idle_state)
