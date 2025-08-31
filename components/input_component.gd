extends Node
class_name InputComponent

''' Specifically, take input from the keyboard, mouse, etc. '''

@export_group("Nodes")
@export var body: Node2D ## Node taking input

var input_vector: Vector2 = Vector2.ZERO ## Normalized input vector for moving
# var attack_vector: Vector2 = Vector2.ZERO ## Normalized vector to attack towards
# var should_attack: bool = false ## Whether to attack or not

# func _input(event: InputEvent) -> void:
# 	# TODO: Disable when UI is present
# 	if event.is_action_pressed("attack") and body:
# 		should_attack = true
# 		attack_vector = body.position.direction_to(body.get_global_mouse_position())

func _process(_delta: float) -> void:
	var h_dir: float = Input.get_axis("move_left", "move_right");
	var v_dir: float = Input.get_axis("move_up", "move_down");

	input_vector = Vector2(h_dir, v_dir).normalized()
