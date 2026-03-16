@tool

extends EditorScript

func _run() -> void:
	var eds = EditorInterface.get_selection().get_selected_nodes()
	print(eds)
	for node in eds:
		print(node.name)
		if node.name == "monsterthing":
			var clip = DisplayServer.clipboard_get()
			var clip_array = clip.split("),")
			var vec_array: Array
			print(clip_array)
			for vec in clip_array:
				vec += ")"
				vec = str_to_var(vec)
				vec_array.append(vec)
			node.global_position = vec_array[0]
			node.global_rotation = vec_array[1]
			node.scale = vec_array[2]
		if node.is_class("AkEvent3D"):
			var clip = DisplayServer.clipboard_get()
			var vec = str_to_var(clip)
			node.global_position = vec
		else:
			var clip = DisplayServer.clipboard_get()
			var clip_array = clip.split("),")
			var vec_array: Array
			print(clip_array)
			for vec in clip_array:
				vec += ")"
				vec = str_to_var(vec)
				vec_array.append(vec)
			node.global_position = vec_array[0]
			node.global_rotation = vec_array[1]
			node.scale = vec_array[2]
		
