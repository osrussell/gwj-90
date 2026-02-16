extends CharacterBody2D

@export var speed = 500

signal lived()
signal died()

func _process(delta: float) -> void:
	get_parent().set_progress(get_parent().get_progress() + speed*delta)
	if get_parent().get_progress_ratio() == 1:
		lived.emit()
		queue_free()


func _on_death_area_area_entered(area: Area2D) -> void:
	# free from queue if it collides with basic enemy!
	if area.is_in_group("enemies"):
		died.emit()
		queue_free()
