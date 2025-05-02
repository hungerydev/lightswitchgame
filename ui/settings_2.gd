extends BoxContainer

func _on_mouse_entered() -> void:
	sb._brightness_hover.emit(true)

func _on_mouse_exited() -> void:
	var timer = get_tree().create_timer(2)
	timer.timeout.connect(_brightness_hover_off)
	await mouse_entered
	if timer:
		timer.timeout.disconnect(_brightness_hover_off)

func _brightness_hover_off() -> void:
	sb._brightness_hover.emit(false)
