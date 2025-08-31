extends Node
class_name AnimationComponent

@export_group("Settings")
@export var idle_tolerance: float = 15.0 ## How close the body's velocity length should be to zero to switch to idle

@export_group("External Nodes")
@export var sprite: Sprite2D
@export var anim_player: AnimationPlayer

func handle_facing_horizontal_direction(direction: float) -> void:
    """ Direction 1 = Right, Direction -1 = Left, Direction 0 = not moving horizontally """
    if direction < 0:
        sprite.flip_h = true
    elif direction > 0:
        sprite.flip_h = false

func handle_movement_animation(body: CharacterBody2D) -> void:
    if body.velocity.length() > idle_tolerance:
        anim_player.play("run")
    else:
        anim_player.play("idle")
