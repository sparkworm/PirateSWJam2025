## Controls the lasso that is thrown by the monkey.  The origin point will be 
## on the monkey, and the travelling point will be converted to global 
## coordinates to compensate for the inherited position.
class_name Lasso
extends Line2D

@export var gravity: float = 100
@export var launch_speed: float = 5
@export var max_length: float = 100

var last_tip_pos: Vector2

@onready var tip: Area2D = $Tip

func _process(_delta: float) -> void:
	last_tip_pos = tip.position

func update_end_point() -> void:
	points[1] = tip.position

## WARNING:  due to how last_tip_pos is updated, significant problems might 
## arise under certain conditions
## [br]
## Returns the difference in position of the tip from the last position to this one
func tip_pos_diff() -> Vector2:
	return tip.position - last_tip_pos
