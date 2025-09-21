extends Node
class_name AnimationComponent

@export_group("Settings")
@export var idle_tolerance: float = 15.0 ## How close the body's velocity length should be to zero to switch to idle
@export var loop_idle: bool = true ## Whether to loop the idle animation

@export_group("External Nodes")
@export var sprite: Sprite2D
@export var anim_player: AnimationPlayer

var idle_started = false

func _ready() -> void:
    sprite.flip_h = randi_range(0, 1) # Randomize facing direction on spawn

func handle_facing_horizontal_direction(direction: float, offset_x: float = 0.0) -> void:
    """ 
    direction 1 = Right, direction -1 = Left, direction 0 = not moving horizontally
    offset_x: how much to move the sprite to the right when facing right or left when facing left
    """
    if direction < 0:
        sprite.flip_h = true
        sprite.offset.x = -offset_x
    elif direction > 0:
        sprite.flip_h = false
        sprite.offset.x = offset_x

func handle_movement_animation(body: CharacterBody2D) -> void:
    if body.velocity.length() > idle_tolerance:
        anim_player.play("run")
        idle_started = false
    elif loop_idle:
        anim_player.play("idle")
    elif not idle_started:
        anim_player.play("idle")
        idle_started = true
