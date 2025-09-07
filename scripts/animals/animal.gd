extends CharacterBody2D
class_name Animal

@export_group("Internal Nodes")
@export var ai_component: AIComponent
@export var movement_component: MovementComponent
@export var animation_component: AnimationComponent
@export var soft_collision: SoftCollision


func _physics_process(_delta: float) -> void:
    ai_component.handle_artificial_input(self)
    movement_component.handle_movement(self, ai_component.input_vector)
    soft_collision.handle_collision(self)
    animation_component.handle_facing_horizontal_direction(ai_component.input_vector.x)
    animation_component.handle_movement_animation(self)
    move_and_slide()
