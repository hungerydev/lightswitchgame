extends WorldEnvironment

func _ready() -> void:
	sb._change_brightness.connect(_adjust_brightness)
	sb._brightness_hover.connect(_texture_visibility)

func _adjust_brightness(value: float) -> void:
	environment.adjustment_brightness = value

func _texture_visibility(value) -> void:
	for child in get_children():
		child.visible = value
