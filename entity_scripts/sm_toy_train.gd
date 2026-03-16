extends Entity

@onready var spot: SpotLight3D = $SpotLight3D
@onready var omni: OmniLight3D = $OmniLight3D
@onready var scom: ShadowCastComponent = $shadow_component

func _event_start(event) -> void:
	match gb.current_hour:
		gb.hour1, gb.hour2, gb.hour3:
			if gf._rc_very_hard():
				chance_active = true
				
		gb.hour4:
			await sb._light_off
			match event:
				gb.hour4.EVENT_4_12:
					scom._set_shadows_only()
	

func _random_chance() -> void:
	await get_tree().create_timer(randf_range(1, 5), false).timeout
	spot.visible = true
	omni.visible = true
	am._play_train_short()
	await get_tree().create_timer(randf_range(0.25, 1), false).timeout
	get_tree().call_group("AkToyTrainEvent", "end")
	spot.visible = false
	omni.visible = false

func _reset() -> void:
	chance_active = false
	vcom._set_visibility_on()
	spot.visible = false
	omni.visible = false
	scom._set_draw_on()
