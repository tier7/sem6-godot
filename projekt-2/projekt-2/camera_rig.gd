extends Node3D

@onready var target = $"../kula"
@export var follow_speed := 5.0

var offset: Vector3

func _ready():
	offset = global_position - target.global_position

func _physics_process(delta):
	var desired_position = target.global_position + offset
	global_position = global_position.lerp(desired_position, min(delta * follow_speed, 1.0))
