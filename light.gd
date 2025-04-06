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

	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("right_click"):
		if on:
			_lights_off()
		else:
			_lights_on()

func _event_start(event) -> void:
	match event:
		gb.events.EVENT_0_0, gb.events.EVENT_0_1:
			_lights_on()
			await sb._event_finished
			_lights_off()
		gb.events.EVENT_1_3:
			_lights_off()
			light_color = Color(0.974, 0.0, 0.16)
		_:
			_lights_off()

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
