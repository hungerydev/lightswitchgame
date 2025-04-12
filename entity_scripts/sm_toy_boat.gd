extends Entity

@onready var scom: ShadowCastComponent = $shadow_component

func _event_start(event) -> void:
	match gb.current_hour:
		gb.hour4:
			match event:
				gb.hour4.EVENT_4_10:
					scom._set_shadows_only()

func _reset() -> void:
	scom._set_draw_on()
	vcom._set_visibility_on()
	pcom._set_position(Vector3(-1.75427, 0.198979, 2.4434),Vector3(0, -2.60338, 0),Vector3(10.5752, 10.5752, 10.5752))
