class_name MonkeyIdleState
extends State

@export var character: CharacterBody2D
@export var lured_state: State
@export var fall_state: State

## Called when state is first loaded
func _ready() -> void:
	pass

## Called every time state is entered
func _enter(_args: Dictionary) -> void:
	target.velocity.y = 0
	MessageBus.lure_deployed.connect(Callable(self, "handle_lure"))
	MessageBus.monkey_grappled.connect(Callable(self, "handle_grapple"))

## Called every time there is a switch to a new state
func _exit() -> void:
	MessageBus.lure_deployed.disconnect(Callable(self, "handle_lure"))
	MessageBus.monkey_grappled.disconnect(Callable(self, "handle_grapple"))

## State equivalent of _process()
func _update(_delta: float) -> void:
	pass

## State equivalent of _physics_process()
func _physics_update(delta: float) -> void:
	if target.velocity.x != 0:
		var sign = target.velocity.x / abs(target.velocity.x)
		target.velocity.x = max(0,abs(target.velocity.x) -
				target.ground_drag * delta) * sign
		target.move_and_slide()
		if not target.is_on_floor():
			state_machine.change_state_to(fall_state)

func handle_lure(lure: Node2D) -> void:
	state_machine.change_state_to(lured_state, {"lure":lure})

func handle_grapple(velocity: Vector2) -> void:
	# should probably replace logic here with a seperate state
	character.velocity += velocity
	character.move_and_slide()
	state_machine.change_state_to(fall_state)
