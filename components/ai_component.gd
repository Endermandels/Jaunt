extends Node
class_name AIComponent

@export_group("External Nodes")
@export var target_detector: TargetDetector
@export var exclamation_mark: ExclamationMark

var tamed: bool = false ## Whether this animal is tamed
var input_vector: Vector2 = Vector2.ZERO ## Normalized input vector for moving

func handle_artificial_input(body: Node2D) -> void:
    # Only move towards player once tamed
    # TODO: Make movement outside of being tamed as well, like wandering
    if target_detector.target and tamed:
        input_vector = body.global_position.direction_to(target_detector.target.global_position)
    else:
        print(input_vector)
        input_vector = Vector2.ZERO

func _process(_delta: float) -> void:
    if not tamed and target_detector.target and target_detector.target.input_component.interact_pressed:
        tamed = true
        exclamation_mark.disable()
