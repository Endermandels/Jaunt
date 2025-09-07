extends Area2D
class_name SoftCollision

@export_group("Settings")
@export var push_strength: float = 25.0 ## How fast to push away

func handle_collision(body: CharacterBody2D) -> void:
    var areas = get_overlapping_areas()
    var push_vector = Vector2.ZERO
    if areas.size() > 0:
        push_vector = areas[0].global_position.direction_to(global_position).normalized()
    body.velocity += body.velocity.move_toward(push_vector * push_strength, push_strength)