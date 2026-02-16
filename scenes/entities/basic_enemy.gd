extends CharacterBody2D

var direction = Vector2.DOWN
var speed = 2000
var max_clicks = 1
var num_clicks = 0

var closest_destination = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	#position += direction * speed
	#for dest in closest_destinations:
	if closest_destination != null:
		var dir = (closest_destination.position - position).normalized()
		velocity = dir * speed * delta
		move_and_slide()

# I want them to travel to the center of the map by default, then go and stay at their nearest node
func _on_detection_area_area_entered(area: Area2D) -> void:
	if area.is_in_group("end_positions") and closest_destination == null:
		closest_destination = area


func _on_click_area_input_event(_viewport: Node, _event: InputEvent, _shape_idx: int) -> void:
	if Input.is_action_just_pressed("click"):
		num_clicks += 1
		if num_clicks == max_clicks:
			queue_free()
