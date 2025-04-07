extends Entity

@export var restpos = [Vector3(0.337757, 0.438782, 2.9471),Vector3(-0.520139, -1.81272, 1.5823),Vector3(0.999999, 1, 1)]

@onready var hitbox_pcom = $monsterHitbox/positionComponent

@onready var anim_player = $AnimationPlayer

func _ready() -> void:
	sb._event_start.connect(_event_start)
	sb._event_finished.connect(_reset)
	
func _event_start(event) -> void:
	await sb._light_off
	match event:
		gb.tutorial.EVENT_0_1:
			vcom._set_visibility_on()
			pcom._set_position(Vector3(-2.46206, 0.12998, 5.39719),Vector3(0.0543694, 0.0259284, 0.054893),Vector3(1, 1, 1))
			anim_player.play("jawagape")
			hitbox_pcom._set_position(Vector3(-2.55667, -0.30804, 4.11227),Vector3(0, 0, 0),Vector3(1.25137, 2.33363, 1.38325))
		gb.tutorial.EVENT_0_4:
			vcom._set_visibility_on()
			pcom._set_position(Vector3(-2.83174, 0.907496, 0.565283),Vector3(-0.108582, 0.2845, 0.137062),Vector3(1, 1, 1))
			anim_player.play("turned")
			hitbox_pcom._set_position(Vector3(-2.91414, -0.11218, -1.36708),Vector3(0, 0, 0),Vector3(1.25137, 2.33363, 1.38325))
		gb.hour1.EVENT_1_1, gb.hour1.EVENT_1_10:
			vcom._set_visibility_on()
			pcom._set_position(Vector3(-2.46206, 0.12998, 5.39719),Vector3(0.0543694, 0.0259284, 0.054893),Vector3(1, 1, 1))
			anim_player.play("jawagape")
			hitbox_pcom._set_position(Vector3(-2.55667, -0.30804, 4.11227),Vector3(0, 0, 0),Vector3(1.25137, 2.33363, 1.38325))
		gb.hour1.EVENT_1_2, gb.hour1.EVENT_1_9:
			vcom._set_visibility_on()
			pcom._set_position(Vector3(-2.46206, 0.12998, 5.39719),Vector3(0.0543694, 0.0259284, 0.054893),Vector3(1, 1, 1))
			anim_player.play("jawagape")
			hitbox_pcom._set_position(Vector3(-2.55667, -0.30804, 4.11227),Vector3(0, 0, 0),Vector3(1.25137, 2.33363, 1.38325))
		gb.hour1.EVENT_1_3, gb.hour1.EVENT_1_8:
			vcom._set_visibility_on()
			pcom._set_position(Vector3(-1.25024, 0.431627, 4.18886),Vector3(-0.108582, 0.000953448, 0.137062),Vector3(1, 1, 1))
			anim_player.play("jawagape")
			hitbox_pcom._set_position(Vector3(-1.8196, -0.11218, 3.99988),Vector3(0, 0, 0),Vector3(1.25137, 2.33363, 1.38325))
		gb.hour1.EVENT_1_4, gb.hour1.EVENT_1_7:
			vcom._set_visibility_on()
			pcom._set_position(Vector3(-2.83174, 0.907496, 0.565283),Vector3(-0.108582, 0.2845, 0.137062),Vector3(1, 1, 1))
			anim_player.play("turned")
			hitbox_pcom._set_position(Vector3(-2.91414, -0.11218, -1.36708),Vector3(0, 0, 0),Vector3(1.25137, 2.33363, 1.38325))
		gb.hour1.EVENT_1_5, gb.hour1.EVENT_1_6:
			vcom._set_visibility_on()
			pcom._set_position(Vector3(2.72262, -0.138755, -0.594696),Vector3(0.0190843, 0.815865, 0.129425),Vector3(1, 1, 1))
			anim_player.play("turned")
			hitbox_pcom._set_position(Vector3(2.72956, -0.963291, -1.36708),Vector3(0, 0, 0),Vector3(1.25137, 2.33363, 1.38325))
		_:
			print("No position logged for " + str(event))


func _reset() -> void:
	vcom._set_visibility_off()
	pcom._set_position(restpos[0],restpos[1], restpos[2])
	hitbox_pcom._set_position(Vector3(0.608086, 0.251468, 2.9471),Vector3(0.0363553, -1.78035, 1.45254),Vector3(1, 1.98868, 1.54615))
