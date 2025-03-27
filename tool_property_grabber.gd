@tool

extends EditorScript

func _run() -> void:
	var eds = EditorInterface.get_selection().get_selected_nodes()
	print(eds)
	for node in eds:
		var position = (node.global_position)
		var rotation = node.global_rotation
		var scale = node.global_scale
		DisplayServer.clipboard_set()
		
