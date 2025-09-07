extends Area2D
class_name TargetDetector

''' Only handles a single target '''

@export_group("Internal Nodes")
@export var collision_shape: CollisionShape2D

var target: Node2D = null

func _ready() -> void:
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func set_detection_radius(radius: float) -> void:
	collision_shape.shape.radius = radius

func _on_body_entered(body: Node2D) -> void:
	target = body

func _on_body_exited(_body: Node2D) -> void:
	target = null
