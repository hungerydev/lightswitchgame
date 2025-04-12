extends Entity

func _event_start(event) -> void:
	match gb.current_hour:
		pass

func _reset() -> void:
	vcom._set_visibility_on()
	pcom._set_position(Vector3(3.89198, 3.37879, 2.5681),Vector3(-0.129346, -0.496617, -0.141046),Vector3(1.67631, 1.67631, 1.67631))
