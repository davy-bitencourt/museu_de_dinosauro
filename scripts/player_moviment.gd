extends CharacterBody2D

@export var speed: float = 200.0

func _physics_process(_delta: float) -> void:
	var direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = direction * speed
	
	if Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down"): $AnimationPlayer.play("move")
	else: $AnimationPlayer.play("stop")
	
	if direction.x < 0: $Sprite2D.flip_h =  true
	elif direction.x > 0: $Sprite2D.flip_h =  false
	
	move_and_slide()
