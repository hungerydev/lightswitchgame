extends Entity

func _event_start(event) -> void:
	match gb.current_hour:
		pass

func _reset() -> void:
	vcom._set_visibility_on()
	pcom._set_position(Vector3(3.082, 0.227841, 2.4477),Vector3(-1.5708, 1.5708, 0),Vector3(1.54678, 1.54678, 1.54678))
