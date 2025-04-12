extends ColorRect

func _ready() -> void:
	visible = false
	sb._event_start.connect(_event_start)

func _event_start(event) -> void:
	if event in gb.hour1.values():
		await sb._event_finished
		var tween = get_tree().create_tween()
		tween.tween_property(material, "shader_parameter/alpha", 0, .4).set_ease(Tween.EASE_IN_OUT)
		visible = true
		await tween.finished
		visible = false
		tween.stop()
		tween.tween_property(material, "shader_parameter/alpha", 0.83, 0.1)
		tween.play()
		
			
