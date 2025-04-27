extends Camera3D

@onready var pcom = $positionComponent

var chance_active = false

func _ready() -> void:
	add_to_group("Entity")
	_reset()
	sb._event_finished.connect(_reset)
	sb._event_start.connect(_event_start)
	

func _event_start(event) -> void:
	match event:
		gb.hour1.EVENT_1_1, gb.hour1.EVENT_1_3, gb.hour1.EVENT_1_10:
			if gf._rc_hard():
				pcom._set_position(Vector3(0, 1.97963, -6.63983),Vector3(0, -3.14159, 2.51327),Vector3(1, 1, 1))
	match gb.current_hour:
		gb.hour1, gb.hour2, gb.hour3:
			if gf._rc_very_hard():
				chance_active = true


func _random_chance() -> void:
	await sb._light_on
	var tween1 = get_tree().create_tween()
	var tween2 = get_tree().create_tween()
	tween2.tween_property(self, "fov", 60, 5)
	tween1.set_trans(Tween.TRANS_LINEAR)
	tween1.tween_property(self, "rotation_degrees", Vector3(0, -180, 180), 10)
	await sb._event_finished
	tween1.stop()
	tween2.stop()
 
func _reset() -> void:
	chance_active = false
	fov = 36.5
	var tween = get_tree().create_tween()
	tween.set_trans(Tween.TRANS_SINE)
	tween.tween_property(self, "fov", 37.8, 0.75).set_ease(Tween.EASE_IN_OUT)
	pcom._set_position(Vector3(0, 1.97963, -6.63983),Vector3(0, -3.14159, 0),Vector3(1, 1, 1))
