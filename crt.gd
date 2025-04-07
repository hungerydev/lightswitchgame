extends ColorRect

func _ready() -> void:
	sb._light_on.connect(_chance)

func _chance() -> void:
	if gf._rc_very_hard():
		_enable()

func _enable() -> void:
	visible = true
	await get_tree().create_timer(4).timeout
	visible = false
