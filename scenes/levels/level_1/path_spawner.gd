extends Node2D

@onready var path = preload("res://scenes/levels/level_1/level_1_animal_path.tscn")

signal new_spawn()

func _on_timer_timeout() -> void:
	var new_animal_path = path.instantiate()
	add_child(new_animal_path)
	new_spawn.emit()
