extends Entity

@export var restpos = [Vector3(0.337757, 0.438782, 2.9471),Vector3(-0.520139, -1.81272, 1.5823),Vector3(0.999999, 1, 1)]

@onready var hitbox_pcom = $monsterHitbox/positionComponent
@onready var hitbox = $monsterHitbox

@onready var anim_player = $AnimationPlayer

var fail: bool = false
	

	
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
					hitbox.monster_active = true
					vcom._set_visibility_on()
					pcom._set_position(Vector3(-1.25024, 0.431627, 4.18886),Vector3(-0.108582, 0.000953448, 0.137062),Vector3(1, 1, 1))
					anim_player.play("jawagape")
					hitbox_pcom._set_position(Vector3(-1.18833, 2.45734, 2.95474),Vector3(0, 0, 0),Vector3(1.67187, 1.47157, 1.98996))
		gb.hour1:
			await sb._light_off
			hitbox.monster_active = true
			match event:
				gb.hour1.EVENT_1_1, gb.hour1.EVENT_1_10:
					vcom._set_visibility_on()
					pcom._set_position(Vector3(-2.46206, 0.12998, 5.39719),Vector3(0.0543694, 0.0259284, 0.054893),Vector3(1, 1, 1))
					anim_player.play("jawagape")
					hitbox_pcom._set_position(Vector3(-1.78429, 2.12603, 2.95474),Vector3(0, 0, 0),Vector3(1.67187, 1.47157, 1.98996))
				gb.hour1.EVENT_1_2, gb.hour1.EVENT_1_9:
					vcom._set_visibility_on()
					pcom._set_position(Vector3(1.96137, -0.782574, 5.39719),Vector3(0.0543694, -2.8717, 0.054893),Vector3(1, 1, 1))
					anim_player.play("jawagape")
					hitbox_pcom._set_position(Vector3(1.7496, 1.3409, 2.95474),Vector3(0, 0, 0),Vector3(1.67187, 1.47157, 1.98996))
				gb.hour1.EVENT_1_3, gb.hour1.EVENT_1_8:
					vcom._set_visibility_on()
					pcom._set_position(Vector3(-1.25024, 0.431627, 4.18886),Vector3(-0.108582, 0.000953448, 0.137062),Vector3(1, 1, 1))
					anim_player.play("jawagape")
					hitbox_pcom._set_position(Vector3(-1.18833, 2.45734, 2.95474),Vector3(0, 0, 0),Vector3(1.67187, 1.47157, 1.98996))
				gb.hour1.EVENT_1_4, gb.hour1.EVENT_1_7:
					vcom._set_visibility_on()
					pcom._set_position(Vector3(-2.83174, 0.907496, 0.565283),Vector3(-0.108582, 0.2845, 0.137062),Vector3(1, 1, 1))
					anim_player.play("turned")
					hitbox_pcom._set_position(Vector3(-3.24107, 2.62502, 0.017158),Vector3(0, 0, 0),Vector3(1.67187, 1.47157, 1.98996))
				gb.hour1.EVENT_1_5, gb.hour1.EVENT_1_6:
					vcom._set_visibility_on()
					pcom._set_position(Vector3(2.72262, -0.138755, -0.594696),Vector3(0.0190843, 0.815865, 0.129425),Vector3(1, 1, 1))
					anim_player.play("turned")
					hitbox_pcom._set_position(Vector3(3.00584, 1.36251, -1.39476),Vector3(0, 0, 0),Vector3(1.67187, 1.47157, 1.98996))
				_:
					print(str(Time.get_ticks_msec()) + ": " + "No position logged for " + str(event))
		gb.hour2:
			await sb._light_off
			hitbox.monster_active = true
			match event:
				gb.hour2.EVENT_2_1:
					vcom._set_visibility_on()
					pcom._set_position(Vector3(3.5321, -0.938226, 0.727899),Vector3(-0.299391, -0.632667, 0.286887),Vector3(1.20673, 1.34781, 1.06431))
					anim_player.play("turned")
					hitbox_pcom._set_position(Vector3(3.00584, 1.36251, -1.39476),Vector3(0, 0, 0),Vector3(1.67187, 1.47157, 1.98996))
				gb.hour2.EVENT_2_2:
					vcom._set_visibility_on()
					pcom._set_position(Vector3(3.52824, -0.916729, 4.71607),Vector3(-0.158323, -2.8865, -0.278312),Vector3(1.20673, 1.3478, 1.0643))
					anim_player.play("jawagape")
					hitbox_pcom._set_position(Vector3(1.93549, 1.36251, 1.73979),Vector3(0, 0, 0),Vector3(1.67187, 1.47157, 1.98996))
				gb.hour2.EVENT_2_3:
					vcom._set_visibility_on()
					pcom._set_position(Vector3(-2.76125, 0.381078, 2.14632),Vector3(0.208156, 2.40732, 0.295556),Vector3(1.20673, 1.3478, 1.0643))
					anim_player.play("turned")
					hitbox_pcom._set_position(Vector3(-1.6496, 2.18451, 1.73979),Vector3(0, 0, 0),Vector3(1.67187, 1.47157, 1.98996))
				gb.hour2.EVENT_2_4:
					vcom._set_visibility_on()
					pcom._set_position(Vector3(0.139594, -1.35031, 4.75368),Vector3(-0.681784, 2.35135, -0.135859),Vector3(1.20673, 1.3478, 1.0643))
					anim_player.play("turned")
					hitbox_pcom._set_position(Vector3(-0.452622, 1.25903, 1.73979),Vector3(0, 0, 0),Vector3(1.67187, 1.47157, 1.98996))
				gb.hour2.EVENT_2_5:
					vcom._set_visibility_on()
					pcom._set_position(Vector3(2.38162, -1.35031, 4.75368),Vector3(-0.265988, -1.25306, 0.201037),Vector3(1.20673, 1.3478, 1.0643))
					anim_player.play("turned")
					hitbox_pcom._set_position(Vector3(1.91034, 0.847017, 3.38751),Vector3(0, 0, 0),Vector3(1.67187, 1.47157, 1.98996))
				gb.hour2.EVENT_2_6:
					vcom._set_visibility_on()
					pcom._set_position(Vector3(2.60341, 0.603668, 2.39189),Vector3(-0.498203, 1.93446, 0.37348),Vector3(1.20673, 1.3478, 1.0643))
					anim_player.play("strutting forward_001")
					hitbox_pcom._set_position(Vector3(2.24106, 2.11535, 3.38751),Vector3(0, 0, 0),Vector3(1.67187, 3.01508, 1.98996))
				gb.hour2.EVENT_2_7:
					vcom._set_visibility_on()
					pcom._set_position(Vector3(2.23405, 0.0422845, 1.0919),Vector3(-0.103843, -1.74652, 0.0154818),Vector3(1.20673, 1.3478, 1.0643))
					anim_player.play("crawling")
					hitbox_pcom._set_position(Vector3(1.36946, 1.03501, -0.593419),Vector3(0, 0, 0),Vector3(1.38965, 1.39279, 1.98996))
				gb.hour2.EVENT_2_8:
					vcom._set_visibility_on()
					pcom._set_position(Vector3(-1.84599, 0.0422845, 1.0919),Vector3(-0.103843, 2.11062, 0.0154818),Vector3(1.20673, 1.3478, 1.0643))
					anim_player.play("crawling")
					hitbox_pcom._set_position(Vector3(-1.19958, 1.03501, -0.593419),Vector3(0, 0, 0),Vector3(1.38965, 1.39279, 1.98996))
				gb.hour2.EVENT_2_9:
					vcom._set_visibility_on()
					pcom._set_position(Vector3(1.5478, 3.23513, 1.0919),Vector3(0.559021, -1.58942, -3.13301),Vector3(1.20673, 1.3478, 1.0643))
					anim_player.play("crawling")
					hitbox_pcom._set_position(Vector3(0.99221, 2.52814, -0.593419),Vector3(0, 0, 0),Vector3(1.38965, 1.39279, 1.98996))
				gb.hour2.EVENT_2_10:
					vcom._set_visibility_on()
					pcom._set_position(Vector3(2.3268, 0.167658, 3.71259),Vector3(0, -1.8009, 0),Vector3(1.20673, 1.3478, 1.0643))
					anim_player.play("crawling")
					hitbox_pcom._set_position(Vector3(1.11811, 1.21637, 0.719154),Vector3(0, 0, 0),Vector3(1.38965, 1.39279, 1.98996))
				_:
					print(str(Time.get_ticks_msec()) + ": " + "No position logged for " + str(event))
		gb.hour3:
			await sb._light_off
			hitbox.monster_active = true
			match event:
				gb.hour3.EVENT_3_1:
					vcom._set_visibility_on()
					pcom._set_position(Vector3(-4.29352, 5.79745, -0.142764),Vector3(1.5708, -0.257908, 0),Vector3(1.20673, 1.3478, 1.0643))
					anim_player.play("strutting forward_001")
					hitbox_pcom._set_position(Vector3(2.88824, 3.1691, 1.46083),Vector3(0, 0, 0),Vector3(1.38965, 2.34234, 1.98996))
				gb.hour3.EVENT_3_2:
					vcom._set_visibility_on()
					pcom._set_position(Vector3(-1.54559, 2.19837, 2.73382),Vector3(0, 0.236283, 0),Vector3(1.20673, 1.3478, 1.0643))
					anim_player.play("turned")
					hitbox_pcom._set_position(Vector3(2.86525, 2.58358, 2.01853),Vector3(0, 0, 0),Vector3(1.38965, 1.39279, 1.98996))
				gb.hour3.EVENT_3_3:
					vcom._set_visibility_on()
					pcom._set_position(Vector3(0, 0, 4.55732),Vector3(0, 0, 0),Vector3(1.20673, 1.34781, 1.0643))
					anim_player.play("turned")
					hitbox_pcom._set_position(Vector3(1.06007, 1.56784, 2.01853),Vector3(0, 0, 0),Vector3(1.38965, 1.39279, 1.98996))
				gb.hour3.EVENT_3_4:
					vcom._set_visibility_on()
					pcom._set_position(Vector3(-1.87131, 2.54531, -0.500194),Vector3(0.606838, 0.342439, -0.178404),Vector3(1.20673, 1.34781, 1.0643))
					anim_player.play("turned")
					hitbox_pcom._set_position(Vector3(2.74307, 1.94799, -1.3113),Vector3(0, 0, 0),Vector3(1.38965, 1.39279, 1.98996))
				gb.hour3.EVENT_3_5:
					vcom._set_visibility_on()
					pcom._set_position(Vector3(-0.566313, 0.352535, 3.3811),Vector3(-0.0128204, -2.1457, 0.598539),Vector3(1.20673, 1.34781, 1.0643))
					anim_player.play("turned")
					hitbox_pcom._set_position(Vector3(1.35802, 1.09177, 0.21617),Vector3(0, 0, 0),Vector3(1.38965, 1.39279, 1.98996))
				gb.hour3.EVENT_3_6:
					vcom._set_visibility_on()
					pcom._set_position(Vector3(-2.77382, 1.62209, 0.0352373),Vector3(0, 2.31068, 0),Vector3(1.20673, 1.34781, 1.0643))
					anim_player.play("turned")
					hitbox_pcom._set_position(Vector3(-1.69002, 2.32963, 2.64118),Vector3(0, 0, 0),Vector3(1.38965, 1.39279, 1.98996))
				gb.hour3.EVENT_3_7:
					vcom._set_visibility_on()
					pcom._set_position(Vector3(2.34129, 0.702987, 2.45709),Vector3(0, -0.813568, 0),Vector3(1.20673, 1.34781, 1.0643))
					anim_player.play("turned")
					hitbox_pcom._set_position(Vector3(1.72674, 1.61277, 2.64118),Vector3(0, 0, 0),Vector3(1.38965, 2.34234, 1.98996))
				gb.hour3.EVENT_3_8:
					vcom._set_visibility_on()
					pcom._set_position(Vector3(2.34129, 0.702987, -5.63811),Vector3(0, -0.813568, 0),Vector3(1.20673, 1.34781, 1.0643))
					anim_player.play("turned")
					hitbox_pcom._set_position(Vector3(2.00915, 1.00517, -1.8377),Vector3(0, 0, 0),Vector3(1.38965, 2.34234, 1.98996))
				gb.hour3.EVENT_3_9:
					vcom._set_visibility_on()
					pcom._set_position(Vector3(-2.18167, 0.0833982, -3.95353),Vector3(0, 0.827496, 0),Vector3(1.20673, 1.34781, 1.0643))
					anim_player.play("jawagape")
					hitbox_pcom._set_position(Vector3(-1.6745, 1.00517, -1.8377),Vector3(0, 0, 0),Vector3(1.38965, 2.34234, 1.98996))
				gb.hour3.EVENT_3_10:
					vcom._set_visibility_on()
					pcom._set_position(Vector3(0.284616, 4.65632, 1.82778),Vector3(1.5708, 1.48319, 0),Vector3(1.20673, 1.3478, 1.0643))
					anim_player.play("strutting forward_001")
					hitbox_pcom._set_position(Vector3(2.88824, 3.82361, 4.62252),Vector3(0, 0, 0),Vector3(1.38965, 2.34234, 1.98996))
		gb.hour4:
			await sb._light_off
			hitbox.monster_active = true
			match event:
				gb.hour4.EVENT_4_1:
					vcom._set_visibility_on()
					pcom._set_position(Vector3(-4.29352, 5.79745, -0.142764),Vector3(1.5708, -0.257908, 0),Vector3(1.20673, 1.3478, 1.0643))
					anim_player.play("jawagape")
					hitbox_pcom._set_position(Vector3(2.82723, 3.22417, 1.46083),Vector3(0, 0, 0),Vector3(0.748383, 0.72267, 0.98436))
				gb.hour4.EVENT_4_2:
					vcom._set_visibility_on()
					pcom._set_position(Vector3(-4.29352, 5.79745, -0.142764),Vector3(1.5708, -0.257908, 0),Vector3(1.20673, 1.3478, 1.0643))
					anim_player.play("Plane_002Action_001")
					hitbox_pcom._set_position(Vector3(3.0102, 3.70356, -0.201784),Vector3(0, 0, 0),Vector3(0.551926, 0.854987, 0.410152))
				gb.hour4.EVENT_4_3:
					vcom._set_visibility_on()
					pcom._set_position(Vector3(-4.29352, 5.79745, -0.142764),Vector3(1.5708, -0.257908, 0),Vector3(1.20673, 1.3478, 1.0643))
					anim_player.play("Plane_002Action_001")
					hitbox_pcom._set_position(Vector3(3.0102, 3.81395, 1.29148),Vector3(0, 0, 0),Vector3(0.551926, 0.854987, 0.410152))
				gb.hour4.EVENT_4_4:
					vcom._set_visibility_on()
					pcom._set_position(Vector3(-4.29352, 5.79745, -0.142764),Vector3(1.5708, -0.257908, 0),Vector3(1.20673, 1.3478, 1.0643))
					anim_player.play("Plane_002Action_001")
					hitbox_pcom._set_position(Vector3(2.58436, 1.96713, 1.0789),Vector3(0, 0, 0),Vector3(0.551926, 0.52527, 0.410152))
				gb.hour4.EVENT_4_5:
					vcom._set_visibility_on()
					pcom._set_position(Vector3(-4.29352, 5.79745, -0.142764),Vector3(1.5708, -0.257908, 0),Vector3(1.20673, 1.3478, 1.0643))
					anim_player.play("Plane_002Action_001")
					hitbox_pcom._set_position(Vector3(2.25128, 0.485372, -1.09402),Vector3(0, 0, 0),Vector3(0.709026, 0.631867, 0.410152))
				gb.hour4.EVENT_4_6:
					vcom._set_visibility_on()
					pcom._set_position(Vector3(-4.29352, 5.79745, -0.142764),Vector3(1.5708, -0.257908, 0),Vector3(1.20673, 1.3478, 1.0643))
					anim_player.play("Plane_002Action_001")
					hitbox_pcom._set_position(Vector3(2.10674, 2.15181, -1.07288),Vector3(0, 0, 0),Vector3(0.709026, 0.631867, 0.410152))
				gb.hour4.EVENT_4_7:
					vcom._set_visibility_on()
					pcom._set_position(Vector3(-4.29352, 5.79745, -0.142764),Vector3(1.5708, -0.257908, 0),Vector3(1.20673, 1.3478, 1.0643))
					anim_player.play("Plane_002Action_001")
					hitbox_pcom._set_position(Vector3(2.35675, 0.650497, -2.01459),Vector3(0, 0, 0),Vector3(0.473765, 0.427254, 0.410152))
				gb.hour4.EVENT_4_8:
					vcom._set_visibility_on()
					pcom._set_position(Vector3(-4.29352, 5.79745, -0.142764),Vector3(1.5708, -0.257908, 0),Vector3(1.20673, 1.3478, 1.0643))
					anim_player.play("Plane_002Action_001")
					hitbox_pcom._set_position(Vector3(1.55712, 1.44637, -2.01459),Vector3(0, 0, 0),Vector3(1.65775, 1.29877, 0.410152))
				gb.hour4.EVENT_4_9:
					vcom._set_visibility_on()
					pcom._set_position(Vector3(-4.29352, 5.79745, -0.142764),Vector3(1.5708, -0.257908, 0),Vector3(1.20673, 1.3478, 1.0643))
					anim_player.play("Plane_002Action_001")
					hitbox_pcom._set_position(Vector3(-1.66756, 1.44637, -2.01459),Vector3(0, 0, 0),Vector3(1.65775, 1.29877, 0.410152))
				gb.hour4.EVENT_4_10:
					vcom._set_visibility_on()
					pcom._set_position(Vector3(-4.29352, 5.79745, -0.142764),Vector3(1.5708, -0.257908, 0),Vector3(1.20673, 1.3478, 1.0643))
					anim_player.play("Plane_002Action_001")
					hitbox_pcom._set_position(Vector3(-0.706886, 1.11663, -0.00675178),Vector3(0, 0, 0),Vector3(1.11683, 0.737763, 0.410152))
				gb.hour4.EVENT_4_11:
					vcom._set_visibility_on()
					pcom._set_position(Vector3(-4.29352, 5.79745, -0.142764),Vector3(1.5708, -0.257908, 0),Vector3(1.20673, 1.3478, 1.0643))
					anim_player.play("Plane_002Action_001")
					hitbox_pcom._set_position(Vector3(-0.61085, 1.45876, -0.00675178),Vector3(0, 0, 0),Vector3(0.794743, 0.737763, 0.410152))
				gb.hour4.EVENT_4_12:
					vcom._set_visibility_on()
					pcom._set_position(Vector3(-4.29352, 5.79745, -0.142764),Vector3(1.5708, -0.257908, 0),Vector3(1.20673, 1.3478, 1.0643))
					anim_player.play("Plane_002Action_001")
					hitbox_pcom._set_position(Vector3(-1.27703, 1.45876, -4.00574),Vector3(0, 0, 0),Vector3(0.794743, 0.737763, 0.410152))
				gb.hour4.EVENT_4_13:
					vcom._set_visibility_on()
					pcom._set_position(Vector3(-4.29352, 5.79745, -0.142764),Vector3(1.5708, -0.257908, 0),Vector3(1.20673, 1.3478, 1.0643))
					anim_player.play("Plane_002Action_001")
					hitbox_pcom._set_position(Vector3(0.807314, 1.32461, -4.00574),Vector3(0, 0, 0),Vector3(0.297762, 0.305405, 0.324705))
				gb.hour4.EVENT_4_14:
					vcom._set_visibility_on()
					pcom._set_position(Vector3(-4.29352, 5.79745, -0.142764),Vector3(1.5708, -0.257908, 0),Vector3(1.20673, 1.3478, 1.0643))
					anim_player.play("Plane_002Action_001")
					hitbox_pcom._set_position(Vector3(1.74549, 2.4057, -3.16164),Vector3(0, 0, 0),Vector3(0.413929, 0.440365, 0.324705))
				gb.hour4.EVENT_4_15:
					vcom._set_visibility_on()
					pcom._set_position(Vector3(-4.29352, 5.79745, -0.142764),Vector3(1.5708, -0.257908, 0),Vector3(1.20673, 1.3478, 1.0643))
					anim_player.play("Plane_002Action_001")
					hitbox_pcom._set_position(Vector3(0.320746, 1.94818, -0.850135),Vector3(0, 0, 0),Vector3(0.851296, 1.74792, 0.324705))
				_:
					print(str(Time.get_ticks_msec()) + ": " + "No position logged for " + str(event))
		gb.trailer:
			match event:
				gb.trailer.t3:
					vcom._set_visibility_on()
					pcom._set_position(Vector3(-2.1414, 0.164057, 4.80948),Vector3(-0.167235, 2.0095, 0.0254998),Vector3(1.20673, 1.34779, 1.0643))
					anim_player.play("turned")
					hitbox_pcom._set_position(Vector3(-2.49906, 2.31092, -1.36708),Vector3(0, 0, 0),Vector3(0.413929, 0.440365, 0.324705))
				gb.trailer.t5:
					vcom._set_visibility_on()
					pcom._set_position(Vector3(2.61054, -0.0399795, 4.21352),Vector3(-0.266686, -1.89065, 0.0656624),Vector3(1.20673, 1.34779, 1.0643))
					anim_player.play("crawling")
					hitbox_pcom._set_position(Vector3(-2.49906, 2.31092, -1.36708),Vector3(0, 0, 0),Vector3(0.413929, 0.440365, 0.324705))

func _fail(string) -> void:
	if gb.current_hour == gb.tutorial:
		get_tree().call_group("Controls", "_disable_controls")
		if string == "tutorial_slow":
			sb._jumpscare_finished.emit(string)
		else: sb._jumpscare_finished.emit("tutorial_fast")
		
	elif gb.death:
		if not fail:
			fail = true
			am._fail(string)
			get_tree().call_group("Controls", "_disable_controls")
			pcom._set_position(Vector3(0, -0.197323, -4.18796),Vector3(0, 0, 0),Vector3(1.20673, 1.34781, 1.0643))
			vcom._set_visibility_on()
			anim_player.play("jumpscare/jumpscare")
			hitbox_pcom._set_position(Vector3(1.98867, 0.384552, 2.3053),Vector3(0, 0, 0),Vector3(1.25137, 2.33363, 1.38325))
			await anim_player.animation_finished
			sb._jumpscare_finished.emit(string)
			am._play_lightbulb_shatter()
			visible = false

func _reset() -> void:

	vcom._set_visibility_off()
	pcom._set_position(restpos[0],restpos[1], restpos[2])
	hitbox_pcom._set_position(Vector3(0.608086, 0.251468, 2.9471),Vector3(0.0363553, -1.78035, 1.45254),Vector3(1, 1.98868, 1.54615))
	hitbox.monster_active = false
	hitbox.misclicks = 0
