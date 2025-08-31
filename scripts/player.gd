extends CharacterBody2D
class_name Player

@export_group("Internal Nodes")
@export var input_cmp: InputComponent
@export var movement_cmp: MovementComponent

func _physics_process(_delta: float) -> void:
	movement_cmp.handle_movement(self, input_cmp.input_vector)
	self.move_and_slide()
