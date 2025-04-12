extends Entity

@onready var scom: ShadowCastComponent = $shadow_component

func _event_start(event) -> void:
	match gb.current_hour:
		gb.hour4:
			match event:
				gb.hour4.EVENT_4_1:
					scom._set_shadows_only()

func _reset() -> void:
	scom._set_draw_on()
	pcom._set_position(Vector3(3.89198, 3.37879, 2.5681),Vector3(-0.129346, -0.496617, -0.141046),Vector3(1.67631, 1.67631, 1.67631))
