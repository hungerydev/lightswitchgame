extends ColorRect

func _ready() -> void:
	visible = false
	sb._light_on.connect(_chance)
	sb._event_finished.connect(_disable)

func _chance() -> void:
	if gf._rc_very_hard():
		_enable()

func _enable() -> void:
	visible = true
	await get_tree().create_timer(4).timeout
	visible = false

func _disable() -> void:
	visible = false
