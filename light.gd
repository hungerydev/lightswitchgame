extends OmniLight3D

var on: bool = true

func _ready() -> void:
	if visible:
		on = true
	else:
		on = false
	sb._event_start.connect(_lights_off)
	sb._event_finished.connect(_reset)

	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("right_click"):
		if on:
			visible = false
			on = false
			am._switch_ambience_light_off()
			sb._light_off.emit()
		else:
			visible = true
			on = true
			am._switch_ambience_light_on()
			sb._light_on.emit()

func _lights_off(event) -> void:
	match event:
		gb.hour1.EVENT_3:
			visible = false
			on = false
			light_color = Color(0.974, 0.0, 0.16)
			await get_tree().create_timer(0.25).timeout
			sb._light_off.emit(event)
		_:
			visible = false
			on = false
			await get_tree().create_timer(0.25).timeout
			sb._light_off.emit(event)

func _reset() -> void:
	light_color = Color(0.454, 0.384, 0.149)
