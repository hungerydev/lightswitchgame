@tool

extends EditorScript

func _run() -> void:
	var eds = EditorInterface.get_selection().get_selected_nodes()
	print(eds)
	for node in eds:
		var position = var_to_str(node.global_position)
		var rotation = var_to_str(node.global_rotation)
		var scale = var_to_str(node.scale)
		var string = r"pcom._set_position(" + position + "," + rotation + "," + scale + ")"
		DisplayServer.clipboard_set(string)
		print(string)
		
