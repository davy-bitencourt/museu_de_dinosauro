extends CharacterBody2D

@export var speed: float = 120.0
var target: Node2D

func _physics_process(_delta):
	var player = get_tree().get_first_node_in_group("Player")
	if player:
		velocity = global_position.direction_to(player.global_position) * speed
		if velocity.x > 0:
			$Sprite2D.flip_h =  true
		elif velocity.x < 0:
			$Sprite2D.flip_h =  false
		move_and_slide()
