extends Node3D

#func _input(event: InputEvent) -> void:
	#if event.is_action_pressed("right_click"):
		#var tween = get_tree().create_tween()
		#tween.tween_property(self, "rotation", Vector3(0,0,90), 1)
		#await tween.finished
		#var tween2 = get_tree().create_tween()
		#tween2.tween_property(self, "rotation", Vector3(0,0,-90), 1)
