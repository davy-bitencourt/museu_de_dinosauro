extends CharacterBody2D

@export var speed: float = 120.0
@export var detection_range: float = 300.0

var target: Node2D

func _ready() -> void:
	target = get_tree().get_first_node_in_group("player")

func _physics_process(_delta: float) -> void:
	if target == null:
		return

	var distance := global_position.distance_to(target.global_position)

	if distance <= detection_range:
		var direction := global_position.direction_to(target.global_position)
		velocity = direction * speed
	else:
		velocity = Vector2.ZERO

	move_and_slide()
