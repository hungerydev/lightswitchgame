extends Entity


@onready var scom: ShadowCastComponent = $shadow_component

func _event_start(event) -> void:
	match gb.current_hour:
		gb.hour4:
			await sb._light_off
			match event:
				gb.hour4.EVENT_4_13:
					scom._set_shadows_only()

func _reset() -> void:
	scom._set_draw_on()
	vcom._set_visibility_on()
	pcom._set_position(Vector3(2.22725, 0.180319, -0.791437),Vector3(0.0699791, -0.548382, -0.0518684),Vector3(1.52643, 1.52643, 1.52643))
