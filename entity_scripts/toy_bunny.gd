extends Entity

@onready var light = $SpotLight3D

@onready var scom: ShadowCastComponent = $shadow_component

func _event_start(event) -> void:
	await sb._light_off
	match event:
		gb.hour1.EVENT_1_4:
			if gf._rc_medium():
				sb._rc_result.emit(true)
				pcom._set_position(Vector3(1.86621, 1.31729, -5.93348),Vector3(0, -1.5342, 0),Vector3(3.45666, 3.45666, 3.45666))
				await sb._light_on
				light.visible = true
				am._play_stingers("none")
			else:
				sb._rc_result.emit(false)
		gb.hour4.EVENT_4_11:
			scom._set_shadows_only()
			

func _reset() -> void:
	scom._set_draw_on()
	pcom._set_position(Vector3(0.355602, 0.69315, 4.76788),Vector3(0, -2.42655, 0),Vector3(3.45666, 3.45666, 3.45666))
	vcom._set_visibility_on()
	light.visible = false
