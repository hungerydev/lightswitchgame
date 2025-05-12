extends OmniLight3D

var on: bool = true

var flicker: bool = false

var control: bool = false


func _ready() -> void:
	add_to_group("Controls")
	visible = false
	on = visible
	sb._event_start.connect(_event_start)
	sb._event_finished.connect(_reset)
	sb._remote_light_on.connect(_lights_on)
	sb._remote_light_off.connect(_lights_off)
	sb._hour_changed.connect(_hour_changed)
	sb._time_fail.connect(_time_fail)
	sb._jumpscare_finished.connect(_lights_off_death)
	sb._light_target_pos.connect(_change_pos)
	_hour_changed(gb.current_hour)

func _change_pos(pos: Vector3) -> void:
	position = pos

func _disable_controls() -> void:
	control = false

func _enable_controls() -> void:
	match gb.current_hour:
		gb.tutorial:
			control = true
		gb.hour1:
			control = true
		gb.hour2:
			control = false
		gb.hour3:
			control = false
		gb.hour4:
			control = true

func _process(_delta: float) -> void:
	if flicker:
		light_energy = randf_range(0,1.5)
	if control:
		if Input.is_action_just_pressed("right_click"):
			if on:
				_lights_off()
			else:
				_lights_on()
			

func _hour_changed(hour) -> void:
	match hour:
		gb.tutorial:
			control = true
		gb.hour1:
			control = true
		gb.hour2:
			control = false
		gb.hour3:
			control = false
		gb.hour4:
			control = true

func _event_start(event) -> void:
	match gb.current_hour:
		gb.tutorial:
			match event:
				gb.tutorial.EVENT_0_0, gb.tutorial.EVENT_0_1:
					control = false
					_lights_on()
					await sb._event_finished
					_lights_off()
				gb.tutorial.EVENT_0_4:
					control = true
					_lights_off()
				gb.tutorial.EVENT_0_5:
					control = false
		gb.hour1:
			match event:
				gb.hour1.EVENT_1_4:
					_lights_off()
					var result = await sb._rc_result
					if result:
						light_color = Color(0.974, 0.0, 0.16)
				_:
					_lights_off()
		gb.hour2cut:
			match event:
				gb.hour2cut.HOUR_2_CUT_3:
					flicker = true
					_lights_on()
					await get_tree().create_timer(0.5).timeout
					_lights_off()
				gb.hour2cut.HOUR_2_CUT_4, gb.hour2cut.HOUR_2_CUT_5:
					_lights_off()
				_:
					_lights_on()
					await sb._event_finished
					_lights_off()
		gb.hour4cut:
			match event:
				gb.hour4cut.HOUR_4_CUT_1, gb.hour4cut.HOUR_4_CUT_2:
					pass
				_:
					_lights_on()
					await sb._event_finished
					_lights_off()
		gb.hour2:
			_lights_off()
		gb.hour3:
			_lights_off()
		gb.hour4:
			_lights_off()
		gb.trailer:
			match event:
				gb.trailer.t3:
					_lights_on()
					await get_tree().create_timer(1.5).timeout
					flicker = true
					await get_tree().create_timer(1.5).timeout
					_lights_off()

func _lights_on() -> void:
	if not am.monster_active:
		if not visible:
			am._play_ls_on()
		visible = true
		on = true
		am._switch_ambience_light_on()
		sb._light_on.emit()
	elif not gb.death:
		visible = true
		on = true
		sb._light_on.emit()
	else:
		visible = true
		on = true
		flicker = true
		sb._fail.emit("fast")
		await sb._jumpscare_finished
		visible = false
		on = false
	
func _lights_off() -> void:
	if visible:
		am._play_ls_off()
	visible = false
	on = false
	am._switch_ambience_light_off()
	await get_tree().create_timer(0.25).timeout
	sb._light_off.emit()
	
func _time_fail(string) -> void:
	if gb.current_hour == gb.tutorial:
		sb._fail.emit("tutorial_slow")
	elif gb.death:
		if not on:
			await sb._light_on
			flicker = true
			sb._fail.emit("slow")
		else:
			_flicker()

func _flicker() -> void:
	control = false
	flicker = true
	await get_tree().create_timer(.1).timeout
	sb._fail.emit("slow")

func _lights_off_death(string) -> void:
	visible = false
	on = false

func _reset() -> void:
	light_color = Color(0.454, 0.384, 0.149)
