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
					hitbox_pcom._set_position(Vector3(-1.91541, 0.175568, 3.55438),Vector3(0, 0, 0),Vector3(1.67187, 1.47157, 1.98996))
				gb.hour1.EVENT_1_2, gb.hour1.EVENT_1_9:
					vcom._set_visibility_on()
					pcom._set_position(Vector3(1.96137, -0.782574, 5.39719),Vector3(0.0543694, -2.8717, 0.054893),Vector3(1, 1, 1))
					anim_player.play("jawagape")
					hitbox_pcom._set_position(Vector3(1.46314, -0.854867, 3.55438),Vector3(0, 0, 0),Vector3(1.67187, 1.47157, 1.98996))
				gb.hour1.EVENT_1_3, gb.hour1.EVENT_1_8:
					vcom._set_visibility_on()
					pcom._set_position(Vector3(-1.25024, 0.431627, 4.18886),Vector3(-0.108582, 0.000953447, 0.137062),Vector3(1, 1, 1))
					anim_player.play("jawagape")
					hitbox_pcom._set_position(Vector3(-1.45538, 0.383135, 3.55438),Vector3(0, 0, 0),Vector3(1.67187, 1.47157, 1.98996))
				gb.hour1.EVENT_1_4, gb.hour1.EVENT_1_7:
					vcom._set_visibility_on()
					pcom._set_position(Vector3(-2.83174, 0.907496, 0.565283),Vector3(-0.108582, 0.2845, 0.137062),Vector3(1, 1, 1))
					anim_player.play("turned")
					hitbox_pcom._set_position(Vector3(-3.31932, 0.163758, -0.532875),Vector3(0, 0, 0),Vector3(1.67187, 1.47157, 1.98996))
				gb.hour1.EVENT_1_5, gb.hour1.EVENT_1_6:
					vcom._set_visibility_on()
					pcom._set_position(Vector3(2.72262, -0.138755, -0.594696),Vector3(0.0190843, 0.815865, 0.129425),Vector3(1, 1, 1))
					anim_player.play("turned")
					hitbox_pcom._set_position(Vector3(3.99044, -0.785651, -0.860082),Vector3(0, 0, 0),Vector3(1.67187, 1.47157, 1.98996))
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
					pcom._set_position(Vector3(-4.29352, 6.55345, -0.142764),Vector3(1.28919, 3.0948, -2.97816),Vector3(1.20673, 1.3478, 1.0643))
					anim_player.play("strutting forward_001")
					hitbox_pcom._set_position(Vector3(2.47235, 4.3159, 4.97582),Vector3(0, 0, 0),Vector3(1.67187, 1.47157, 1.98996))
				gb.hour3.EVENT_3_2:
					vcom._set_visibility_on()
					pcom._set_position(Vector3(-1.54559, 2.19837, 2.73382),Vector3(0, 0.236283, 0),Vector3(1.20673, 1.3478, 1.0643))
					anim_player.play("turned")
					hitbox_pcom._set_position(Vector3(3.47799, 0.24285, 3.55438),Vector3(0, 0, 0),Vector3(1.67187, 1.47157, 1.98996))
				gb.hour3.EVENT_3_3:
					vcom._set_visibility_on()
					pcom._set_position(Vector3(-2.43651, 1.00368, 4.51364),Vector3(-0.180622, -1.95504, -0.357666),Vector3(1.20673, 1.34781, 1.0643))
					anim_player.play("jawagape")
					hitbox_pcom._set_position(Vector3(2.70199, -0.468749, 2.3053),Vector3(0, 0, 0),Vector3(1.90318, 1.85188, 1.38325))
				gb.hour3.EVENT_3_4:
					vcom._set_visibility_on()
					pcom._set_position(Vector3(-1.87131, 0.7724, 1.27787),Vector3(0.565478, 0.57366, -0.198744),Vector3(1.20673, 1.34781, 1.0643))
					anim_player.play("turned")
					hitbox_pcom._set_position(Vector3(4.26683, -1.34139, 0.395485),Vector3(0, 0, 0),Vector3(1.90318, 1.85188, 1.38325))
				gb.hour3.EVENT_3_5:
					vcom._set_visibility_on()
					pcom._set_position(Vector3(-2.32695, 0.339514, 4.14985),Vector3(0.841833, -0.18121, -1.20172),Vector3(1.20673, 1.34781, 1.0643))
					anim_player.play("turned")
					hitbox_pcom._set_position(Vector3(1.54034, -0.344809, 4.99121),Vector3(0, 0, 0),Vector3(2.60543, 1.85188, 1.38325))
				gb.hour3.EVENT_3_6:
					vcom._set_visibility_on()
					pcom._set_position(Vector3(-2.77382, 1.62209, 0.0352373),Vector3(0, 2.31068, 0),Vector3(1.20673, 1.34781, 1.0643))
					anim_player.play("turned")
					hitbox_pcom._set_position(Vector3(-2.85321, 1.62016, 4.99121),Vector3(0, 0, 0),Vector3(2.42869, 2.83205, 1.38325))
				gb.hour3.EVENT_3_7:
					vcom._set_visibility_on()
					pcom._set_position(Vector3(2.34129, 0.702987, 2.45709),Vector3(0, -0.813568, 0),Vector3(1.20673, 1.34781, 1.0643))
					anim_player.play("turned")
					hitbox_pcom._set_position(Vector3(2.23948, 1.62016, 4.99121),Vector3(0, 0, 0),Vector3(2.42869, 2.83205, 1.38325))
				gb.hour3.EVENT_3_8:
					vcom._set_visibility_on()
					pcom._set_position(Vector3(2.34129, 0.702987, -5.63811),Vector3(0, -0.813568, 0),Vector3(1.20673, 1.34781, 1.0643))
					anim_player.play("turned")
					hitbox_pcom._set_position(Vector3(2.93533, 1.62016, -1.14399),Vector3(0, 0, 0),Vector3(2.42869, 2.83205, 1.38325))
				gb.hour3.EVENT_3_9:
					vcom._set_visibility_on()
					pcom._set_position(Vector3(-2.18167, 0.0833982, -3.95353),Vector3(0, 0.827496, 0),Vector3(1.20673, 1.34781, 1.0643))
					anim_player.play("jawagape")
					hitbox_pcom._set_position(Vector3(-2.5451, 1.50648, -1.14399),Vector3(0, 0, 0),Vector3(2.42869, 2.83205, 1.98996))
				gb.hour3.EVENT_3_10:
					vcom._set_visibility_on()
					pcom._set_position(Vector3(0.284616, 5.53097, 1.82778),Vector3(1.27486, -1.77204, 3.0406),Vector3(1.20673, 1.3478, 1.0643))
					anim_player.play("strutting forward_001")
					hitbox_pcom._set_position(Vector3(2.47235, 4.3159, 4.97582),Vector3(0, 0, 0),Vector3(2.42869, 1.47157, 1.98996))
				_:
					print("No position logged for " + str(event))

func _fail() -> void:
	if gb.death:
		pcom._set_position(Vector3(0, -0.197323, -4.18796),Vector3(0, 0, 0),Vector3(1.20673, 1.34781, 1.0643))
		anim_player.play("jumpscare")
		hitbox_pcom._set_position(Vector3(1.98867, 0.384552, 2.3053),Vector3(0, 0, 0),Vector3(1.25137, 2.33363, 1.38325))

func _reset() -> void:
	vcom._set_visibility_off()
	pcom._set_position(restpos[0],restpos[1], restpos[2])
	hitbox_pcom._set_position(Vector3(0.608086, 0.251468, 2.9471),Vector3(0.0363553, -1.78035, 1.45254),Vector3(1, 1.98868, 1.54615))
