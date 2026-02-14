extends Node2D

@export var total_spawn_limit = 5
@export var total_animals_spawned = 0
@export var animals_that_survived = 0
@export var animals_that_died = 0

func _process(delta: float) -> void:
	check_level_end()

func register_success():
	animals_that_survived += 1
	
func register_death():
	animals_that_died += 1
	
func check_level_end():
	if animals_that_died + animals_that_survived >= total_spawn_limit:
		print("LEVEL DONE!")

func _on_path_spawner_new_spawn() -> void:
	total_animals_spawned += 1
	if total_animals_spawned >= total_spawn_limit:
		$PathSpawner/Timer.stop()
