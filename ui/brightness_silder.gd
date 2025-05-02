extends HSlider

func _ready() -> void:
	value = gb.brightness_setting



func _on_value_changed(number: float) -> void:
	gb.brightness_setting = number


func _on_mouse_entered() -> void:
	sb._brightness_hover.emit(true)
	

func _on_mouse_exited() -> void:
	var timer = get_tree().create_timer(2)
	timer.timeout.connect(_bright_hover_off)
	await mouse_entered
	timer.timeout.disconnect(_bright_hover_off)
	

func _bright_hover_off() -> void:
	sb._brightness_hover.emit(false)
