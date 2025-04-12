extends Entity

@onready var scom: ShadowCastComponent = $shadow_component

func _event_start(event) -> void:
	match gb.current_hour:
		gb.hour4:
			match event:
				gb.hour4.EVENT_4_7:
					scom._set_shadows_only()

func _reset() -> void:
	scom._set_draw_on()
	vcom._set_visibility_on()
	pcom._set_position(Vector3(2.82016, -0.0625293, -0.963212),Vector3(1.5708, 0, 0),Vector3(1, 1, 1))
