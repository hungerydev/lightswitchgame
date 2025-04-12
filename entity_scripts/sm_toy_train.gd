extends Entity

@onready var spot: SpotLight3D = $SpotLight3D
@onready var omni: OmniLight3D = $OmniLight3D
@onready var scom: ShadowCastComponent = $shadow_component

func _event_start(event) -> void:
	match gb.current_hour:
		gb.hour1, gb.hour2, gb.hour3:
			if gf._rc_very_hard():
				await get_tree().create_timer(randf_range(1, 5)).timeout
				_lights_on()
				#TODO: add audio for a train whistle
		gb.hour4:
			await sb._light_off
			match event:
				gb.hour4.EVENT_4_12:
					scom._set_shadows_only()
	

func _lights_on() -> void:
	spot.visible = true
	omni.visible = true

func _reset() -> void:
	vcom._set_visibility_on()
	spot.visible = false
	omni.visible = false
	scom._set_draw_on()
