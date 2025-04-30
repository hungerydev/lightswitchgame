extends AnimatedSprite2D

func _ready() -> void:
	scale.x = get_window().size.x / 1920.0
	scale.y = get_window().size.y / 1080.0
