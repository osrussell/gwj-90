extends Node2D

@onready var animal_on_path = preload("res://scenes/levels/level_1/level_1_animal_path.tscn")
@onready var enemy = preload("res://scenes/entities/basic_enemy.tscn")

@export var total_spawn_limit = 5
@export var total_animals_spawned = 0
@export var animals_that_survived = 0
@export var animals_that_died = 0

func _process(_delta: float) -> void:
	check_level_end()

func register_success():
	animals_that_survived += 1
	
func register_death():
	animals_that_died += 1
	
func check_level_end():
	if animals_that_died + animals_that_survived >= total_spawn_limit:
		print("LEVEL DONE!")

func _on_animal_timer_timeout() -> void:
	var new_animal_path = animal_on_path.instantiate()
	$PathSpawner.add_child(new_animal_path)
	total_animals_spawned += 1
	
	if total_animals_spawned >= total_spawn_limit:
		$PathSpawner/AnimalTimer.stop()

func _on_enemy_timer_timeout() -> void:
	var new_enemy = enemy.instantiate() as CharacterBody2D
	$EnemySpawner.add_child(new_enemy)
	# set new position
	var position_marker = $EnemySpawner/EnemyStartPositions.get_children().pick_random() as Marker2D
	new_enemy.position = position_marker.position
