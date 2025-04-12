@tool

extends EditorScript

func _run() -> void:
	var eds = EditorInterface.get_selection().get_selected_nodes()
	print(eds)
	for node in eds:
		node.global_position = node.restpos[0]
		node.global_rotation = node.restpos[1]
		node.scale = node.restpos[2]
		
