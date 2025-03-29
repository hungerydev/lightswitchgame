@tool

extends EditorScript

func _run() -> void:
	var eds = EditorInterface.get_selection().get_selected_nodes()
	print(eds)
	for node in eds:
		if node is not Entity:
			var box_size = var_to_str(node.get_child(0).shape.size)
			var position = var_to_str(node.global_position)
			var rotation = var_to_str(node.global_rotation)
			var string = r"pcom._set_position(" + position + "," + rotation + "," + box_size + ")"
			DisplayServer.clipboard_set(string)
			print(string)
		else:
			var position = var_to_str(node.global_position)
			var rotation = var_to_str(node.global_rotation)
			var scale = var_to_str(node.scale)
			var string = r"pcom._set_position(" + position + "," + rotation + "," + scale + ")"
			DisplayServer.clipboard_set(string)
			print(string)
		
