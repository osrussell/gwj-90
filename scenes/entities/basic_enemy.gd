extends CharacterBody2D

var direction = Vector2.DOWN
var speed = 100

var closest_destination = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	#position += direction * speed
	#for dest in closest_destinations:
	if closest_destination != null:
		var dir = (closest_destination.position - position).normalized()
		velocity = dir * speed
		move_and_slide()

# I want them to travel to the center of the map by default, then go and stay at their nearest node
func _on_detection_area_area_entered(area: Area2D) -> void:
	if area.is_in_group("end_positions") and closest_destination == null:
		print("adding area ", area)
		closest_destination = area
	#if area.is_in_group("end_positions") and area not in closest_destinations:
	#	print("adding area")
	#	closest_destinations.append(area)
