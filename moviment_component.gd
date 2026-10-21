extends Node

@export var player_or_IA : int = 0;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if player_or_IA == 0:
		print("Player Control")
		state_machine(0)
	else:
		print("IA Entity Control")
		state_machine(1)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

var StateMoviment : enum = []

func state_machine(player_or_ia: int) -> void:
	pass
