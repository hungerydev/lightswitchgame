extends Node

func _ready() -> void:
	sb._monster_clicked.connect(_monster_clicked)
	sb._event_finished.connect(_event_finished)
	await get_tree().create_timer(1).timeout
	_start_event()

	
func _monster_clicked() -> void:
	sb._event_finished.emit()

func _start_event() -> void:
	for child in get_children():
		if child.name == gb.current_hour:
			#var event = child.get_children().pick_random()
			var event = child.get_child(3)
			event._trigger_event_start()

func _event_finished() -> void:
	await get_tree().create_timer(1).timeout
	_start_event()
