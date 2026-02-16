extends Path2D

@export var speed = 500

signal lived()
signal died()

func _on_migrating_animal_lived() -> void:
	lived.emit()

func _on_migrating_animal_died() -> void:
	died.emit()
