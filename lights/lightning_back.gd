extends SpotLight3D

var on: bool = true

func _ready() -> void:
	visible = false
	on = visible
	sb._event_start.connect(_event_start)
	sb._event_finished.connect(_reset)
	sb._remote_light_on.connect(_lights_on)
	sb._remote_light_off.connect(_lights_off)
	#sb._hour_changed.connect(_hour_changed)

func _process(_delta: float) -> void:
	if visible:
		light_energy = randf_range(0,1.5)
	
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
					_lights_off()
					await get_tree().create_timer(randf_range(1, 5)*gb.difficulty).timeout
					_lights_on()
					var timer = get_tree().create_timer(3*gb.difficulty)
					timer.timeout.connect(_too_slow)
					await sb._event_finished
					timer.timeout.disconnect(_too_slow)
				
				
func _lights_on() -> void:
	visible = true
	on = true
	sb._lightning_strike.emit()
	
func _lights_off() -> void:
	visible = false
	on = false
	await get_tree().create_timer(0.25).timeout
	sb._light_off.emit()

func _reset() -> void:
	light_color = Color(0.631, 0.969, 0.902)
	visible = false
	on = false

func _too_slow() -> void:
	sb._fail.emit()
