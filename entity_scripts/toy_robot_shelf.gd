extends Entity

@onready var scom: ShadowCastComponent = $shadow_component

func _event_start(event) -> void:
	match gb.current_hour:
		gb.hour4:
			match event:
				gb.hour4.EVENT_4_3:
					scom._set_shadows_only()

func _reset() -> void:
	scom._set_draw_on()
	vcom._set_visibility_on()
	pcom._set_position(Vector3(3.59732, 4.36791, 2.10568),Vector3(1.5708, -1.28697, 0),Vector3(1.52643, 1.52643, 1.52643))
