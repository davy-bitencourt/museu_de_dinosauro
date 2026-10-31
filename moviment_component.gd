extends Node

@export var player_or_IA : int = 0;
@onready var entity: CharacterBody2D = get_parent()

var player_states: Array[Callable]
var ia_states: Array[Callable]

enum State { IDLE, WALK }
var current_player_state: State = State.IDLE
var current_ia_state: State = State.IDLE

func _ready() -> void:
	player_states = [idle_state, walk_state]
	ia_states = [ia_idle_state, ia_walk_state]

func _physics_process(_delta: float) -> void:
	state_machine(player_or_IA)

func change_state(player_or_ia: int, new_state: State) -> void:
	if player_or_ia == 0:
		current_player_state = new_state
	else:
		current_ia_state = new_state

func state_machine(player_or_ia: int) -> void:
	if player_or_ia == 0:
		player_states[current_player_state].call()
	else:
		ia_states[current_ia_state].call()


# PLAYER STATES
func idle_state() -> void:
	print("Player Entrou em Idle")
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if direction != Vector2.ZERO:
		change_state(0, State.WALK)

func walk_state() -> void:
	print("Player Entrou em Walk")
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var speed : float = 200.0
	
	entity.velocity = direction * speed
	entity.move_and_slide()
	
	if direction == Vector2.ZERO:
		change_state(0, State.IDLE)
	else:
		pass


# IA STATES
func ia_idle_state() -> void:
	print("IA Entrou em Idle")
	pass

func ia_walk_state() -> void:
	print("IA Entrou em Walk")
	pass
