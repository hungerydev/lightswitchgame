extends ColorRect

var chance_active = false

func _ready() -> void:
	add_to_group("Entity")
	visible = false
	sb._event_start.connect(_chance)
	sb._event_finished.connect(_disable)

func _chance() -> void:
	if gf._rc_very_hard():
		chance_active = true

func _random_chance() -> void:
	await sb._light_on
	visible = true
	await get_tree().create_timer(4).timeout
	visible = false

func _disable() -> void:
	visible = false
	chance_active = false
