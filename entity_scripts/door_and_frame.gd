extends Entity

func _event_start(event) -> void:
	match gb.current_hour:
		gb.hour4:
			match event:
				gb.hour4.EVENT_4_15:
					vcom._set_visibility_off()

func _reset() -> void:
	vcom._set_visibility_on()
