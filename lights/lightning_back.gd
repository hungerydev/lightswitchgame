extends SpotLight3D

var on: bool = true

var fail: bool = false

func _ready() -> void:
	visible = false
	on = visible
	sb._event_start.connect(_event_start)
	sb._event_finished.connect(_reset)
	sb._jumpscare_finished.connect(_lights_off_death)


	#sb._hour_changed.connect(_hour_changed)

func _process(_delta: float) -> void:
	if visible:
		light_energy = randf_range(0,3)
		await get_tree().create_timer(.25, false).timeout
	
#func _input(event: InputEvent) -> void:
	#if event.is_action_pressed("right_click"):
		#if on:
			#_lights_off()
		#else:
			#_lights_on()

#func _hour_changed(hour) -> void:
	#match hour:
		#gb.tutorial:
			#set_process_input(true)
		#gb.hour1:
			#set_process_input(true)
		#gb.hour2:
			#set_process_input(false)

func _event_start(event) -> void:
	match gb.current_hour:
		gb.hour3:
			match event:
				gb.hour3.EVENT_3_6, gb.hour3.EVENT_3_7, gb.hour3.EVENT_3_8, gb.hour3.EVENT_3_9, gb.hour3.EVENT_3_10:
					_lightning_event_step_one()
		gb.hour2cut:
			match event:
				gb.hour2cut.HOUR_2_CUT_3:
					_lights_on()
					await get_tree().create_timer(4, false).timeout
					_lights_off()
					sb._event_finished.emit()
				
func _lightning_event_step_one() -> void:
	_lights_off()
	var timer = get_tree().create_timer(randf_range(1, 5)*gb.difficulty, false)
	timer.timeout.connect(_lightning_event_step_two)
	await sb._event_finished
	timer.timeout.disconnect(_lightning_event_step_two)
	
	
func _lightning_event_step_two() -> void:
	_lights_on()
	var timer = get_tree().create_timer(2*gb.difficulty, false)
	timer.timeout.connect(_too_slow)
	await sb._event_finished
	timer.timeout.disconnect(_too_slow)
				
func _lights_on() -> void:
	visible = true
	on = true
	am._play_thun("back")
	sb._lightning_strike.emit()
	
func _lights_off() -> void:
	visible = false
	on = false
	await get_tree().create_timer(0.25, false).timeout
	sb._light_off.emit()

func _reset() -> void:
	light_color = Color(0.631, 0.969, 0.902)
	visible = false
	on = false
	fail = false

func _lights_off_death(string) -> void:
	visible = false
	on = false

func _too_slow() -> void:
	if not fail:
		sb._fail.emit("slow")
		fail = true
