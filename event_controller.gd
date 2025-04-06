extends Node

func _ready() -> void:
	sb._monster_clicked.connect(_monster_clicked)
	sb._event_finished.connect(_event_finished)
	sb._manual_event_start.connect(_start_event)
	await get_tree().create_timer(1).timeout
	_start_event()

var tutorial_int: int = 0
	
func _monster_clicked() -> void:
	sb._event_finished.emit()

func _start_event() -> void:
	if gb.override_event_target == null:
		match gb.current_hour:
			gb.tutorial:
				if gb.current_hour == gb.tutorial:
					if len(gb.tutorial.values()) > tutorial_int:
						var new_event = gb.current_hour.values()[tutorial_int]
						print(new_event)
						sb._event_start.emit(new_event)
						tutorial_int += 1
					else:
						gb.current_hour = "hour1"
						_start_event()
			gb.hour1:
				var new_event = gb.event_dict[gb.current_hour].pick_random()
				print(new_event)
				sb._event_start.emit(new_event)
	else:
		var new_event = gb.override_event_target
		print(new_event)
		print(str(new_event) + " is from an active override")
		sb._event_start.emit(new_event)
		
	#for child in get_children():
		#if child.name == gb.current_hour:
			##var event = child.get_children().pick_random()
			#var event = child.get_child(3)
			#event._trigger_event_start()

func _event_finished() -> void:
	await get_tree().create_timer(1).timeout
	_start_event()
