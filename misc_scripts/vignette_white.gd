extends ColorRect

func _ready() -> void:
	visible = false
	sb._event_start.connect(_event_start)

func _event_start(event) -> void:
	match gb.current_hour:
		gb.tutorial:
			match event:
				gb.tutorial.EVENT_0_4:
					pass
					#_white_vignette()
		gb.hour1, gb.hour2, gb.hour3, gb.hour4:
			_white_vignette()
		
func _white_vignette() -> void:
	await sb._event_finished
	var tween = get_tree().create_tween()
	tween.tween_property(material, "shader_parameter/alpha", 0, .4).set_ease(Tween.EASE_IN_OUT)
	visible = true
	await tween.finished
	visible = false
	tween.stop()
	tween.tween_property(material, "shader_parameter/alpha", 0.83, 0.1)
	tween.play()
