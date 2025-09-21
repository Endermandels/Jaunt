extends Node
class_name InputComponent

''' Specifically, take input from the keyboard, mouse, etc. '''

var input_vector: Vector2 = Vector2.ZERO ## Normalized input vector for moving

var interact_pressed: bool = false

func _unhandled_key_input(event: InputEvent) -> void:
    if event.is_action_pressed("interact"):
        interact_pressed = true
        get_tree().create_timer(0.05).timeout.connect(func (): interact_pressed = false)
    if event.is_action_pressed("ui_cancel"):
        get_tree().quit()

func _process(_delta: float) -> void:
    var h_dir: float = Input.get_axis("move_left", "move_right");
    var v_dir: float = Input.get_axis("move_up", "move_down");

    input_vector = Vector2(h_dir, v_dir).normalized()
