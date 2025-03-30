extends OmniLight3D

var on: bool = true

func _ready() -> void:
	if visible:
		on = true
	else:
		on = false
	SignalBus._event_1_1.connect(_lights_off)
	SignalBus._event_1_2.connect(_lights_off)
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("right_click"):
		if on:
			visible = false
			on = false
			AudioManager._switch_ambience_light_off()
		else:
			visible = true
			on = true
			AudioManager._switch_ambience_light_on()

func _lights_off() -> void:
	visible = false
	on = false
