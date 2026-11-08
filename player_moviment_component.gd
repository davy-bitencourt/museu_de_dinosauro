extends GridMovementComponent


func _physics_process(_delta: float) -> void:
	var direction := Vector2i.ZERO

	if Input.is_action_just_pressed("ui_up"):
		direction = Vector2i.UP
		print("cima")
	elif Input.is_action_just_pressed("ui_down"):
		direction = Vector2i.DOWN
	elif Input.is_action_just_pressed("ui_left"):
		direction = Vector2i.LEFT
	elif Input.is_action_just_pressed("ui_right"):
		direction = Vector2i.RIGHT

	if direction != Vector2i.ZERO:
		move_on_grid(direction)
