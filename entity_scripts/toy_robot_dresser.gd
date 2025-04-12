extends Entity

func _event_start(event) -> void:
	match gb.current_hour:
		pass

func _reset() -> void:
	pcom._set_position(Vector3(2.68196, 2.03573, 1.60102),Vector3(-0.0138966, 2.76799, -1.50319),Vector3(1.52643, 1.52643, 1.52643))
	vcom._set_visibility_on()
