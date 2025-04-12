extends Entity

@onready var scom: ShadowCastComponent = $shadow_component

func _event_start(event) -> void:
	match gb.current_hour:
		gb.hour4:
			match event:
				gb.hour4.EVENT_4_4:
					scom._set_shadows_only()

func _reset() -> void:
	scom._set_draw_on()
	pcom._set_position(Vector3(2.68196, 2.03573, 1.60102),Vector3(-0.0138966, 2.76799, -1.50319),Vector3(1.52643, 1.52643, 1.52643))
	vcom._set_visibility_on()
