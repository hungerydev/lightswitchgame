extends Entity

@onready var scom: ShadowCastComponent = $shadow_component

func _event_start(event) -> void:
	match gb.current_hour:
		gb.hour4:
			match event:
				gb.hour4.EVENT_4_6:
					scom._set_shadows_only()
 
func _reset() -> void:
	scom._set_draw_on()
	vcom._set_visibility_on()
