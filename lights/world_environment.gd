extends WorldEnvironment

func _ready() -> void:
	environment.background_energy_multiplier = 0
	sb._change_brightness.connect(_adjust_brightness)
	sb._brightness_hover.connect(_texture_visibility)
	environment.adjustment_brightness = gb.brightness_setting
	sb._event_start.connect(_sunrise)

func _adjust_brightness(value: float) -> void:
	environment.adjustment_brightness = value

func _texture_visibility(value) -> void:
	for child in get_children():
		child.visible = value

func _sunrise(event) -> void:
	if event == gb.end1.END_1_1:
		var tween = get_tree().create_tween()
		tween.tween_property(self.environment, "background_energy_multiplier", 0.07, 10)
	if event == gb.end1.END_1_5:
		_reset()
	if event == gb.end1.END_1_6:
		environment.background_energy_multiplier = 0.07
	if event == gb.end1.END_1_9:
		_reset()

func _reset() -> void:
	environment.background_energy_multiplier = 0
