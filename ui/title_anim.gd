extends AnimatedSprite2D

func _ready() -> void:
	scale.x = (get_window().size.x / 1152.0) * 0.3
	scale.y = scale.x
	position.x = get_window().size.x / 2.046
	position.y = get_window().size.y / 2.521
