extends Entity

@onready var lights: Node3D = $lights

@onready var scom: ShadowCastComponent = $shadow_component

func _event_start(event) -> void:
	match gb.current_hour:
		gb.hour4:
			await sb._light_off
			match event:
				gb.hour4.EVENT_4_13:
					scom._set_shadows_only()
				_:
					if gf._rc_hard():
						_lights_on()
		gb.hour1, gb.hour2, gb.hour3:
			if gf._rc_hard():
				await get_tree().create_timer(randf_range(1,3)).timeout
				_lights_on()
		

func _lights_on() -> void:
	lights.visible = true

func _reset() -> void:
	scom._set_draw_on()
	vcom._set_visibility_on()
	pcom._set_position(Vector3(2.22725, 0.180319, -0.791437),Vector3(0.0699791, -0.548382, -0.0518684),Vector3(1.52643, 1.52643, 1.52643))
	lights.visible = false
