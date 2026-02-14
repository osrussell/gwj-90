extends Node2D

@onready var path = preload("res://scenes/levels/level_1/level_1_animal_path.tscn")

func _on_timer_timeout() -> void:
	var tempPath = path.instantiate()
	add_child(tempPath)
