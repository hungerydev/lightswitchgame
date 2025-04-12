extends Entity

func _event_start(event) -> void:
	match gb.current_hour:
		pass

func _reset() -> void:
	vcom._set_visibility_on()
	pcom._set_position(Vector3(3.59732, 4.36791, 2.10568),Vector3(1.5708, -1.28697, 0),Vector3(1.52643, 1.52643, 1.52643))
