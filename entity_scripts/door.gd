extends Entity


func _event_start(event) -> void:
	match gb.current_hour:
		gb.hour1, gb.hour2, gb.hour3:
			await sb._light_on
			if gf._rc_medium():
				_open()
		
func _open() -> void:
	var tween = get_tree().create_tween()
	tween.set_ease(Tween.EASE_OUT) 
	tween.set_trans(Tween.TRANS_QUAD)
	tween.tween_property(self, "rotation_degrees", Vector3(0,0,-60.4), 5)
	am._play_scrapes("scrape2.ogg")
	await sb._event_finished
	tween.stop()
	

func _reset() -> void:
	pcom._set_position(Vector3(1.42795, 2.40736, 6.06637),Vector3(-1.5708, 1.5708, 0),Vector3(1, 1, 1.00321))
