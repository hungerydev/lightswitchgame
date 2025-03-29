extends Entity

@export var restpos = [Vector3(0.337757, 0.438782, 2.9471),Vector3(-0.520139, -1.81272, 1.5823),Vector3(0.999999, 1, 1)]

func _ready() -> void:
	SignalBus._event_1_1.connect(_event_1_1)
	SignalBus._event_finished.connect(_reset)
	
func _event_1_1() -> void:
	vcom._set_visibility_on()
	pcom._set_position(Vector3(-2.5995, 0.932312, 2.9471),Vector3(-0.418134, -1.17297, 0.318906),Vector3(0.999999, 1, 1))

func _reset() -> void:
	vcom._set_visibility_off()
	pcom._set_position(restpos[0],restpos[1], restpos[2])
