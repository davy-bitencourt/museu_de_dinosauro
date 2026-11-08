extends GridMovementComponent

@export var target: Node2D
@export var step_interval: float = 0.5  # segundos entre cada passo

var _timer := 0.0


func _ready() -> void:
	super._ready()
	if target == null:
		target = get_tree().current_scene.find_child("Player", true, false)


func _physics_process(delta: float) -> void:
	if target == null or tilemap == null:
		return

	_timer += delta
	if _timer < step_interval:
		return
	_timer = 0.0

	var difference := world_to_cell(target.global_position) - get_cell()
	var direction := Vector2i.ZERO

	if abs(difference.x) > abs(difference.y):
		direction.x = signi(difference.x)
	elif difference.y != 0:
		direction.y = signi(difference.y)

	if direction != Vector2i.ZERO:
		move_on_grid(direction)
