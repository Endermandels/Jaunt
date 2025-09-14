extends Node2D
class_name AnimalSpawner

'''
Whenever the player moves, randomly determine when to spawn an animal by checking the value of a random number every X second interval.
Spawn animals at a random location within Y units of the player but not in the player's camera view.
'''

const CatScene = preload("res://scenes/animals/cat.tscn")
const FerretScene = preload("res://scenes/animals/ferret.tscn")
const FoxScene = preload("res://scenes/animals/fox.tscn")

@export_group("Settings")
@export var spawn_chance: float = 0.1 ## Percentage chance of spawning an animal on successful spawn check

@export_group("External Nodes")
@export var player: Player
@export var spawn_node: Node2D ## Node to add spawned animals under

@export_group("Internal Nodes")
@export var spawn_area: CollisionShape2D
@export var timer: Timer

var min_dist: float = 0.0

static func get_random_animal() -> Animal:
	'''
	Returns a random Animal instance.
	'''
	var rnd = randi_range(0, 2)
	if rnd == 1:
		return FerretScene.instantiate()
	if rnd == 2:
		return FoxScene.instantiate()
	return CatScene.instantiate()

func _ready() -> void:
	var vrect = get_viewport_rect()
	min_dist = vrect.get_center().distance_to(vrect.position) + 16 # Extra padding
	
	timer.timeout.connect(check_for_spawn)

func spawn_animal() -> void:
	var dist = randf_range(min_dist, spawn_area.shape.radius)
	var angle = randf_range(0, 2*PI)
	var dir = Vector2(cos(angle), sin(angle))
	var pos = global_position + dir * dist
	var animal = get_random_animal()
	animal.global_position = pos
	spawn_node.add_child(animal)

func check_for_spawn() -> void:
	# Detect player movement
	if global_position != player.global_position:
		global_position = player.global_position
		# Check for spawning an animal
		if randf() < spawn_chance:
			spawn_animal()
