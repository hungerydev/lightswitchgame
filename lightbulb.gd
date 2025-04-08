extends OmniLight3D

var on: bool = true

func _ready() -> void:
	if visible:
		on = true
	else:
		on = false
	sb._event_start.connect(_event_start)
	sb._event_finished.connect(_reset)
	sb._remote_light_on.connect(_lights_on)
	sb._remote_light_off.connect(_lights_off)
	sb._hour_changed.connect(_hour_changed)

	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("right_click"):
		if on:
			_lights_off()
		else:
			_lights_on()

func _hour_changed(hour) -> void:
	match hour:
		gb.tutorial:
			set_process_input(true)
		gb.hour1:
			set_process_input(true)
		gb.hour2:
			set_process_input(false)

func _event_start(event) -> void:
	match event:
		gb.tutorial.EVENT_0_0, gb.tutorial.EVENT_0_1:
			_lights_on()
			await sb._event_finished
			_lights_off()
		gb.hour1.EVENT_1_4:
			_lights_off()
			var result = await sb._rc_result
			if result:
				light_color = Color(0.974, 0.0, 0.16)
		_:
			if event in gb.hour1.values():
				_lights_off()
			elif event in gb.hour2.values():
				pass

func _lights_on() -> void:
	visible = true
	on = true
	sb._light_on.emit()
	
func _lights_off() -> void:
	visible = false
	on = false
	await get_tree().create_timer(0.25).timeout
	sb._light_off.emit()

func _reset() -> void:
	light_color = Color(0.454, 0.384, 0.149)
