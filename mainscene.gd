extends Node3D


func _ready() -> void:
	add_to_group("Emitter Controller")
	if gb.use_particles:
		get_tree().call_group("Emitter Controller", "_add_emitter")

func _add_emitter() -> void:
	if get_tree().get_node_count_in_group("Particle Emitter") < 2:
		var emitter = preload("uid://dnm3l4sdnlbt").instantiate()
		add_child(emitter)
