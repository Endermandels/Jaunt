extends Animal
class_name Cobra

func _physics_process(_delta: float) -> void:
	ai_component.handle_artificial_input(self)
	movement_component.handle_movement(self, ai_component.input_vector)
	soft_collision.handle_collision(self)
	animation_component.handle_facing_horizontal_direction(ai_component.input_vector.x, 4)
	animation_component.handle_movement_animation(self)
	move_and_slide()
