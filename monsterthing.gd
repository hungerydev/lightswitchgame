extends Entity

@export var restpos = [Vector3(0.337757, 0.438782, 2.9471),Vector3(-0.520139, -1.81272, 1.5823),Vector3(0.999999, 1, 1)]

@onready var hitbox_pcom = $monsterHitbox/positionComponent

@onready var anim_player = $AnimationPlayer

func _ready() -> void:
	sb._event_start.connect(_event_start)
	sb._event_finished.connect(_reset)
	sb._fail.connect(_fail)
	
	
func _event_start(event) -> void:
	match gb.current_hour:
		gb.tutorial:
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
		gb.hour1:
			await sb._light_off
			match event:
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
		gb.hour2:
			await sb._light_off
			match event:
				gb.hour2.EVENT_2_1:
					vcom._set_visibility_on()
					pcom._set_position(Vector3(3.85314, 0.726065, 0.727899),Vector3(-0.280792, -0.0970432, 0.318312),Vector3(1.20673, 1.34781, 1.06431))
					anim_player.play("turned")
					hitbox_pcom._set_position(Vector3(2.42698, 0.771861, -0.587452),Vector3(0, 0, 0),Vector3(1.25137, 2.33363, 1.38325))
				gb.hour2.EVENT_2_2:
					vcom._set_visibility_on()
					pcom._set_position(Vector3(3.52824, -0.916729, 4.71607),Vector3(-0.148684, -2.8865, -0.308914),Vector3(1.20673, 1.3478, 1.0643))
					anim_player.play("jawagape")
					hitbox_pcom._set_position(Vector3(1.54638, -0.770717, 2.3053),Vector3(0, 0, 0),Vector3(1.25137, 2.33363, 1.38325))
				gb.hour2.EVENT_2_3:
					vcom._set_visibility_on()
					pcom._set_position(Vector3(-2.76125, 0.381078, 2.14632),Vector3(0.195412, 2.40732, 0.327799),Vector3(1.20673, 1.3478, 1.0643))
					anim_player.play("turned")
					hitbox_pcom._set_position(Vector3(-2.05321, -0.475597, 2.3053),Vector3(0, 0, 0),Vector3(1.25137, 2.33363, 1.38325))
				gb.hour2.EVENT_2_4:
					vcom._set_visibility_on()
					pcom._set_position(Vector3(0.139594, -1.35031, 4.75368),Vector3(-0.633671, 2.35135, -0.151512),Vector3(1.20673, 1.3478, 1.0643))
					anim_player.play("turned")
					hitbox_pcom._set_position(Vector3(-0.566985, -1.64717, 2.3053),Vector3(0, 0, 0),Vector3(1.25137, 2.33363, 1.38325))
				gb.hour2.EVENT_2_5:
					vcom._set_visibility_on()
					pcom._set_position(Vector3(2.38162, -1.35031, 4.75368),Vector3(-0.249564, -1.25306, 0.223801),Vector3(1.20673, 1.3478, 1.0643))
					anim_player.play("turned")
					hitbox_pcom._set_position(Vector3(1.50784, -1.64717, 2.3053),Vector3(0, 0, 0),Vector3(1.25137, 2.33363, 1.38325))
				gb.hour2.EVENT_2_6:
					vcom._set_visibility_on()
					pcom._set_position(Vector3(2.60341, 0.603668, 2.39189),Vector3(-0.465622, 1.93446, 0.412564),Vector3(1.20673, 1.3478, 1.0643))
					anim_player.play("strutting forward")
					hitbox_pcom._set_position(Vector3(1.98867, 0.384552, 2.3053),Vector3(0, 0, 0),Vector3(1.25137, 2.33363, 1.38325))
				_:
					print("No position logged for " + str(event))
		gb.hour3:
			await sb._light_off
			match event:
				gb.hour3.EVENT_3_1:
					vcom._set_visibility_on()
					pcom._set_position(Vector3(1.55964, 1.50384, 2.18613),Vector3(-0.378247, 2.3323, -0.997666),Vector3(1.20673, 1.3478, 1.0643))
					anim_player.play("turned")
					hitbox_pcom._set_position(Vector3(2.42698, -0.393915, -0.587452),Vector3(0, 0, 0),Vector3(1.25137, 2.33363, 1.38325))
				_:
					print("No position logged for " + str(event))

func _fail() -> void:
	pcom._set_position(Vector3(0, -0.197323, -4.18796),Vector3(0, 0, 0),Vector3(1.20673, 1.34781, 1.0643))
	anim_player.play("jumpscare")
	hitbox_pcom._set_position(Vector3(1.98867, 0.384552, 2.3053),Vector3(0, 0, 0),Vector3(1.25137, 2.33363, 1.38325))

func _reset() -> void:
	vcom._set_visibility_off()
	pcom._set_position(restpos[0],restpos[1], restpos[2])
	hitbox_pcom._set_position(Vector3(0.608086, 0.251468, 2.9471),Vector3(0.0363553, -1.78035, 1.45254),Vector3(1, 1.98868, 1.54615))
