extends Node
class_name SFXHandler

@export_group("External Nodes")
@export var walk_sfx: AudioStreamPlayer2D

func play_walk_sfx() -> void:
    walk_sfx.pitch_scale = randf_range(1, 2)
    walk_sfx.play()