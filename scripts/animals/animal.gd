extends CharacterBody2D
class_name Animal

@export_group("Internal Nodes")
@export var ai_component: AIComponent
@export var movement_component: MovementComponent
@export var animation_component: AnimationComponent
@export var soft_collision: SoftCollision

func _ready() -> void:
    get_tree().create_timer(30).timeout.connect(check_despawn) # Despawn after a minute if not tamed

func check_despawn() -> void:
    if not ai_component.tamed:
        # Only despawn if not currently on the screen
        var viewport_size = get_viewport().get_visible_rect().size
        var camera_rect = Rect2(get_viewport().get_camera_2d().get_screen_center_position() - viewport_size * 0.5, viewport_size)
        if not camera_rect.has_point(global_position):
            queue_free()
        else:
            get_tree().create_timer(30).timeout.connect(check_despawn) # Despawn after a minute if not tamed

func _physics_process(_delta: float) -> void:
    ai_component.handle_artificial_input(self)
    movement_component.handle_movement(self, ai_component.input_vector)
    soft_collision.handle_collision(self)
    animation_component.handle_facing_horizontal_direction(ai_component.input_vector.x)
    animation_component.handle_movement_animation(self)
    move_and_slide()
