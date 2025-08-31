extends Sprite2D
class_name ExclamationMark

@export_group("External Nodes")
@export var target_detector: TargetDetector

var disabled: bool = false

func _ready() -> void:
    hide()

func _process(_delta: float) -> void:
    if not disabled:
        visible = target_detector.target != null
    elif visible:
        hide()

func disable() -> void:
    disabled = true
