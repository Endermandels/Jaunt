extends Node
class_name BGMusicHandler

'''
Purpose: To randomly decide to play a random selection of BG music
'''

@export_group("Settings")
@export var min_wait_time: float = 10 ## Minimum amount of time to wait until next BG music
@export var max_wait_time: float = 60 ## Maximum amount of time to wait until next BG music

@export_group("Internal Nodes")
@export var bg_music_nodes: Array[AudioStreamPlayer]

func _ready() -> void:
    _queue_next_bg_music()
    for music in bg_music_nodes:
        music.finished.connect(_queue_next_bg_music)

func _queue_next_bg_music() -> void:
    get_tree().create_timer(randf_range(min_wait_time, max_wait_time)).timeout.connect(_play_bg_music)

func _play_bg_music() -> void:
    var music := bg_music_nodes[randi_range(0, bg_music_nodes.size() - 1)]
    music.play()
