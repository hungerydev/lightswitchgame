extends Camera3D

@onready var pcom = $positionComponent

func _ready() -> void:
	sb._event_finished.connect(_reset)
	sb._event_start.connect(_event_start)

func _event_start(event) -> void:
	await sb._light_off
	match event:
		gb.hour1.EVENT_1_1, gb.hour1.EVENT_1_3, gb.hour1.EVENT_1_10:
			if gf._rc_hard():
				pcom._set_position(Vector3(0, 1.97963, -6.63983),Vector3(0, 3.14159, 2.51327),Vector3(1, 1, 1))


func _reset() -> void:
	pcom._set_position(Vector3(0, 1.97963, -6.63983),Vector3(0, -3.14159, 0),Vector3(1, 1, 1))
