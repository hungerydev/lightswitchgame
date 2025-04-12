extends Entity


func _event_start(event) -> void:
	match gb.current_hour:
		gb.hour1, gb.hour2:
			if gf._rc_hard():
				pcom._set_position(Vector3(-2.58153, 6.25396, 1.80571),Vector3(1.5708, -1.5708, 0),Vector3(2.08341, 2.08341, 2.08341))
		gb.hour4:
			match event:
				gb.hour4.EVENT_4_9:
					vcom._set_visibility_off()

func _reset() -> void:
	vcom._set_visibility_on()
	pcom._set_position(Vector3(-2.58153, 0.147893, 1.80571),Vector3(-1.5708, -1.5708, 0),Vector3(2.08341, 2.08341, 2.08341))
