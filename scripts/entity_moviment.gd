extends CharacterBody2D

@export var speed: float = 125.0
var target: Node2D

func _ready() -> void:
	$Area2D.body_entered.connect(_on_body_entered)

func _physics_process(_delta):
	var player = get_tree().get_first_node_in_group("Player")
	if player:
		velocity = global_position.direction_to(player.global_position) * speed
		if velocity.x > 0: $Sprite2D.flip_h =  true
		elif velocity.x < 0: $Sprite2D.flip_h =  false
		$AnimationPlayer.play("move")
		move_and_slide()

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		get_tree().change_scene_to_file.call_deferred("res://scenes/game_over.tscn")
