extends Area2D
enum Type { ARTEFATO, ITEM }
@export var type : Type;
@export var n_item = 0;

func _ready() -> void:
	$Sprite2D.frame = n_item;
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		
		queue_free()
