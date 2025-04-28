extends BoxContainer

func _ready() -> void:
	sb._brightness_hover.connect(_visibility)

func _visibility(value) -> void:
	visible = value
