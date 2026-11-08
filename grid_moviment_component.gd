class_name GridMovementComponent
extends Node

var tilemap: TileMapLayer
@onready var entity: CharacterBody2D = get_parent()


func _ready() -> void:
	# Procura o TileMapLayer em qualquer lugar da cena atual, pelo nome.
	tilemap = get_tree().current_scene.find_child("TileMapLayer", true, false)
	if tilemap == null:
		push_error("Nenhum nó chamado 'TileMapLayer' encontrado na cena.")
		return

	entity.add_to_group("grid_entity")
	# Alinha a entidade ao centro da célula onde ela começou.
	entity.global_position = cell_to_world(get_cell())


func world_to_cell(world_pos: Vector2) -> Vector2i:
	return tilemap.local_to_map(tilemap.to_local(world_pos))


func cell_to_world(cell: Vector2i) -> Vector2:
	return tilemap.to_global(tilemap.map_to_local(cell))


func get_cell() -> Vector2i:
	return world_to_cell(entity.global_position)


func is_cell_occupied(cell: Vector2i) -> bool:
	for other in get_tree().get_nodes_in_group("grid_entity"):
		if other != entity and world_to_cell(other.global_position) == cell:
			return true
	return false


func move_on_grid(direction: Vector2i) -> bool:
	print("move_on_grid chamado: ", direction)

	if tilemap == null:
		print("FALHOU: tilemap é null")
		return false

	var target_cell := get_cell() + direction
	print("célula atual: ", get_cell(), " destino: ", target_cell)

	if tilemap.get_cell_source_id(target_cell) == -1:
		print("FALHOU: não tem tile pintado no destino")
		return false

	if is_cell_occupied(target_cell):
		print("FALHOU: célula ocupada")
		return false

	entity.global_position = cell_to_world(target_cell)
	print("moveu para ", entity.global_position)
	return true
