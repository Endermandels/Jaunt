extends Sprite2D
class_name ExclamationMark

@export_group("External Nodes")
@export var target_detector: TargetDetector

func _ready() -> void:
    hide()

func _process(_delta: float) -> void:
    visible = target_detector.target != null