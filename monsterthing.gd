extends Entity

@export var restpos = [Vector3(0.337757, 0.438782, 2.9471),Vector3(-0.520139, -1.81272, 1.5823),Vector3(0.999999, 1, 1)]

func _ready() -> void:
	SignalBus._event_1_1.connect(_event_1_1)
	SignalBus._event_finished.connect(_reset)
	
func _event_1_1() -> void:
	vcom._set_visibility_on()
	pcom._set_position(Vector3(-1.94657, 2.61226, 2.5265),Vector3(-0.807752, -1.07546, 1.58206),Vector3(1.08798, 1.06489, 1.45419))

func _reset() -> void:
	vcom._set_visibility_off()
	pcom._set_position(restpos[0],restpos[1], restpos[2])
