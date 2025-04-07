extends AnimatedSprite2D

func _ready() -> void:
	visible = false
	sb._event_start.connect(_event_start)

func _event_start(event) -> void:
	match event:
		gb.events.EVENT_0_0:
			visible = true
			play("i_want_to_play")
			await get_tree().create_timer(4).timeout
			visible = false
			sb._event_finished.emit()
		gb.events.EVENT_0_1:
			play("ill_hide_you_find")
			visible = true
			await get_tree().create_timer(4).timeout
			visible = false
			sb._event_finished.emit()
		gb.events.EVENT_0_2:
			play("no_peeking")
			visible = true
			await get_tree().create_timer(4).timeout
			visible = false
			sb._event_finished.emit()
		gb.events.EVENT_0_4:
			play("okay_ready")
			visible = true
			await sb._light_on
			visible = false
		gb.events.EVENT_0_5:
			play("lets_play")
			visible = true
			await get_tree().create_timer(4).timeout
			visible = false
			sb._event_finished.emit()
