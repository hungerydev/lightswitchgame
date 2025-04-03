extends OmniLight3D

var on: bool = true

func _ready() -> void:
	if visible:
		on = true
	else:
		on = false
	sb._event_start.connect(_lights_off)
	#sb._event_1_1.connect(_lights_off)
	#sb._event_1_2.connect(_lights_off)
	#sb._event_1_3.connect(_lights_off)
	
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
		_:
			visible = false
			on = false
