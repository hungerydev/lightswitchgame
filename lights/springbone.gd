extends SpringBoneSimulator3D

#func _input(event: InputEvent) -> void:
	#if event.is_action_pressed("right_click"):
		#print("Right clik received")
		#set_gravity_direction(0, Vector3(1,-1,0))
		#set_gravity(0,1)
		#print(get_gravity_direction(0))
		#await get_tree().create_timer(1).timeout
		##set_gravity_direction(0, Vector3(0,-1,0))
		##print(get_gravity_direction(0))
	#
