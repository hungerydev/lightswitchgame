extends Entity


func _event_start(event) -> void:
	match gb.current_hour:
		gb.hour1, gb.hour2, gb.hour3, gb.hour4:
			if gf._rc_very_hard():
				chance_active = true
		gb.end3:
			match event:
				gb.end3.END_3_1:
					_random_chance()
		
		
func _random_chance() -> void:
	await sb._light_on
	var tween = get_tree().create_tween()
	tween.set_ease(Tween.EASE_OUT) 
	tween.set_trans(Tween.TRANS_QUAD)
	tween.tween_property(self, "rotation_degrees", Vector3(0,0,-60.4), 5)
	am._play_scrapes("scrape2.ogg")
	await sb._event_finished
	tween.stop()
	

func _reset() -> void:
	chance_active = false
	pcom._set_position(Vector3(1.42795, 2.40736, 6.06637),Vector3(-1.5708, 1.5708, 0),Vector3(1, 1, 1.00321))
