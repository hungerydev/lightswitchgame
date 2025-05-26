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
					if gf._rc_very_hard():
						chance_active = true
		gb.hour1, gb.hour2, gb.hour3:
			if gf._rc_very_hard():
				chance_active = true


func _process(delta: float) -> void:
	if lights.visible:
		var energy = randf_range(0,1.5)
		for child in lights.get_children():
			child.light_energy = energy
		

func _random_chance() -> void:
	await get_tree().create_timer(randf_range(1,3)).timeout
	am._play_robot()
	lights.visible = true

func _reset() -> void:
	chance_active = false
	scom._set_draw_on()
	vcom._set_visibility_on()
	pcom._set_position(Vector3(2.22725, 0.201687, -0.791437),Vector3(0.0458236, -0.548381, -0.0518683),Vector3(1.52643, 1.52643, 1.52643))
	lights.visible = false
