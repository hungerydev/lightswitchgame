extends Node3D

func _ready() -> void:
	add_to_group("Emitter Controller")

func _add_emitter() -> void:
	if get_tree().get_node_count_in_group("Particle Emitter") < 2:
		var emitter = preload("uid://br3qdcs5o0o3f").instantiate()
		add_child(emitter)
