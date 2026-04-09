extends CharacterBody3D

const SPEED = 10.0
const ROTSPEED = 10
	
func _physics_process(delta):
	if Input.is_action_pressed("ui_right") and Input.is_action_pressed("ui_left"):
		velocity.x = 0
	elif Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
		$playerball.rotate_z(deg_to_rad(-ROTSPEED))
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
		$playerball.rotate_z(deg_to_rad(ROTSPEED))
	else:
		velocity.x = lerp(velocity.x, 0.0, 0.1)

	if Input.is_action_pressed("ui_up") and Input.is_action_pressed("ui_down"):
		velocity.z = 0
	elif Input.is_action_pressed("ui_up"):
		velocity.z = -SPEED
		$playerball.rotate_x(deg_to_rad(ROTSPEED))
	elif Input.is_action_pressed("ui_down"):
		velocity.z = SPEED
		$playerball.rotate_x(deg_to_rad(ROTSPEED))
	else:
		velocity.z = lerp(velocity.z, 0.0, 0.1)

	move_and_slide()



func _on_enemy_body_entered(body: Node3D) -> void:
	if body.name == "kula":
		get_tree().change_scene_to_file("res://endgameinterface.tscn")
