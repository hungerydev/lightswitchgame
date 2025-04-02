extends Entity

@export var restpos = [Vector3(0.337757, 0.438782, 2.9471),Vector3(-0.520139, -1.81272, 1.5823),Vector3(0.999999, 1, 1)]

@onready var hitbox_pcom = $monsterHitbox/positionComponent

func _ready() -> void:
	SignalBus._event_1_1.connect(_event_1_1)
	SignalBus._event_1_2.connect(_event_1_2)
	SignalBus._event_1_3.connect(_event_1_3)
	SignalBus._event_finished.connect(_reset)
	
func _event_1_1() -> void:
	vcom._set_visibility_on()
	pcom._set_position(Vector3(-2.5995, 0.932312, 2.9471),Vector3(-0.418134, -1.7795, 0.318906),Vector3(0.999999, 1, 1))
	hitbox_pcom._set_position(Vector3(-3.03967, -0.0924598, 1.13138),Vector3(0, 0, 0),Vector3(0.824253, 2.259, 1.38325))
	
func _event_1_2() -> void:
	vcom._set_visibility_on()
	pcom._set_position(Vector3(2.9612, 0.655509, 2.43495),Vector3(-0.433757, -3.13646, 0.0892702),Vector3(1, 1, 1))
	hitbox_pcom._set_position(Vector3(2.84316, -0.515362, 1.81669),Vector3(0, 0, 0),Vector3(0.824253, 1.2711, 1.38325))
	
func _event_1_3() -> void:
	vcom._set_visibility_on()
	pcom._set_position(Vector3(0.648266, 0.0566634, 3.58559),Vector3(-0.108582, 3.12876, 0.137062),Vector3(1, 1, 1))
	hitbox_pcom._set_position(Vector3(0.995448, -0.515362, 3.99988),Vector3(0, 0, 0),Vector3(1.974, 3.10235, 1.38325))

func _reset() -> void:
	vcom._set_visibility_off()
	pcom._set_position(restpos[0],restpos[1], restpos[2])
	hitbox_pcom._set_position(Vector3(0.608086, 0.251468, 2.9471),Vector3(0.0363553, -1.78035, 1.45254),Vector3(1, 1.98868, 1.54615))
