extends Node
class_name AIComponent

@export_group("Settings")
@export var close_enough_range: float = 60.0 ## Distance from player to stop moving
@export var follow_range: float = 350.0 ## Radius of player detection once tamed

@export_group("External Nodes")
@export var target_detector: TargetDetector
@export var exclamation_mark: ExclamationMark

var tamed: bool = false ## Whether this animal is tamed
var input_vector: Vector2 = Vector2.ZERO ## Normalized input vector for moving

func handle_artificial_input(body: Node2D) -> void:
    # Only move towards player once tamed
    # TODO: Make movement outside of being tamed as well, like wandering
    if tamed and target_detector.target and body.global_position.distance_to(target_detector.target.global_position) > close_enough_range:
        input_vector = body.global_position.direction_to(target_detector.target.global_position)
    else:
        print(input_vector)
        input_vector = Vector2.ZERO

func _process(_delta: float) -> void:
    if not tamed and target_detector.target and target_detector.target.input_component.interact_pressed:
        tamed = true
        exclamation_mark.disable()
        target_detector.set_detection_radius(follow_range)
