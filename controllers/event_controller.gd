extends Node

func _ready() -> void:
	sb._monster_clicked.connect(_monster_clicked)
	sb._event_finished.connect(_event_finished)
	sb._manual_event_start.connect(_start_event)
	await get_tree().create_timer(1).timeout
	_start_event()


	
func _monster_clicked() -> void:
	sb._event_finished.emit()

func _start_event() -> void:
	if gb.override_event_target == null:
		match gb.current_hour:
			gb.tutorial:
				if gb.current_hour == gb.tutorial:
					var new_event = gb.current_hour.values()[pm.tutoriali]
					print(new_event)
					sb._event_start.emit(new_event)
					gb.difficulty = 10.0
			gb.hour1, gb.hour2, gb.hour3, gb.hour4:
				gb.difficulty = gb.difficulty_setting
				var new_event = er._choose_random_event()
				print(new_event)
				sb._event_start.emit(new_event)
			gb.hour5:
				gb.difficulty = gb.difficulty_setting
				var event = gb._hour5()
				sb._event_start.emit(event)
				await sb._event_finished
				gb.current_hour = gb.hour5
			gb.custom_mode:
				gb.difficulty = gb.difficulty_setting
				var event = gb._custom_mode()
				sb._event_start.emit(event)
				await sb._event_finished
				gb.current_hour = gb.custom_mode
			gb.endless_mode:
				var event = gb._hour5()
				sb._event_start.emit(event)
				await sb._event_finished
				gb.current_hour = gb.endless_mode
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
	await get_tree().create_timer(randf_range(0.75,1.5)).timeout
	_start_event()
