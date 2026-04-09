extends Area3D

signal coinCollected

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rotate_y(deg_to_rad(1))
	

func _on_coin_entered(body: Node3D) -> void:
	if body.name == "kula":
		$AnimationPlayer.play("bounce")
		$Timer.start()
		


func _on_timer_timeout() -> void:
	coinCollected.emit()
	queue_free()
