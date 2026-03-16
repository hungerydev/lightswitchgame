@tool

extends EditorScript

func _run() -> void:
	var eds = EditorInterface.get_selection().get_selected_nodes()
	print(eds)
	for node in eds:
		print(node.name)
		if node.name == "monsterthing":
			var position = var_to_str(node.global_position)
			var rotation = var_to_str(node.global_rotation)
			var scale = var_to_str(node.scale)
			var string1 = r"pcom._set_position(" + position + "," + rotation + "," + scale + ")"
			var anim = var_to_str(node.get_child(1).assigned_animation)
			var string2 = r"anim_player.play(" + anim + ")"
			var box_size = var_to_str(node.get_child(2).get_child(0).shape.size)
			var box_position = var_to_str(node.get_child(2).global_position)
			var box_rotation = var_to_str(node.get_child(2).global_rotation)
			var string3 = r"hitbox_pcom._set_position(" + box_position + "," + box_rotation + "," + box_size + ")"
			DisplayServer.clipboard_set(string1 + string2 + string3)
			print(string1 + string2 + string3)
		if node.is_class("AkEvent3D"):
			var string = var_to_str(node.global_position)
			DisplayServer.clipboard_set(string)
			print(string)
		else:
			var position = var_to_str(node.global_position)
			var rotation = var_to_str(node.rotation)
			var scale = var_to_str(node.scale)
			var string = r"pcom._set_position(" + position + "," + rotation + "," + scale + ")"
			DisplayServer.clipboard_set(string)
			print(string)
		
