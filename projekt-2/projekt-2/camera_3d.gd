extends Camera3D

@onready var target = $"../../kula"

@export var idle_pos := Vector3(0, 3, 5)
@export var move_pos := Vector3(0, 4, 8)

@export var zoom_smoothness := 3.0
@export var max_speed_for_zoom := 5.0

func _physics_process(delta):
	var horizontal_speed = Vector2(target.velocity.x, target.velocity.z).length()

	# zamiana prędkości na zakres 0..1
	var speed_ratio = clamp(horizontal_speed / max_speed_for_zoom, 0.0, 1.0)

	# gdy speed_ratio = 0 -> idle_pos
	# gdy speed_ratio = 1 -> move_pos
	var desired_pos = idle_pos.lerp(move_pos, speed_ratio)

	# płynne dochodzenie kamery do nowej pozycji
	position = position.lerp(desired_pos, delta * zoom_smoothness)
