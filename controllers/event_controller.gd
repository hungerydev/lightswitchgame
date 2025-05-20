extends Node

var cutscene: bool = false

var hour5loop: bool = true

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_PAUSABLE
	sb._monster_clicked.connect(_monster_clicked)
	sb._event_finished.connect(_event_finished)
	sb._manual_event_start.connect(_start_event)
	sb._hour5_loop_deactivate.connect(_disable_hour_5_loop)
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
					print(str(Time.get_ticks_msec()) + ": " + str(new_event))
					sb._event_start.emit(new_event)
					gb.difficulty = 0.8
			gb.hour2cut:
				var new_event = gb.hour2cut.values()[pm.hour2cuti]
				print(str(Time.get_ticks_msec()) + ": " + str(new_event))
				if pm.hour2cuti < 2:
					cutscene = true
					sb._remote_light_off.emit()
					am._play_cut_music_snippets("Cut_Snip_1.ogg")
					await get_tree().create_timer(8).timeout
					sb._event_start.emit(gb.hour2cut.HOUR_2_CUT_1)
					await get_tree().create_timer(8).timeout
					sb._event_start.emit(gb.hour2cut.HOUR_2_CUT_2)
					cutscene = false
				else:
					sb._event_start.emit(new_event)
			gb.hour3cut:
				var new_event = gb.hour3cut.values()[pm.hour3cuti]
				print(str(Time.get_ticks_msec()) + ": " + str(new_event))
				if pm.hour3cuti < 2:
					cutscene = true
					sb._remote_flashlight_off.emit()
					am._play_cut_music_snippets("Cut_Snip_2.ogg")
					await get_tree().create_timer(8).timeout
					sb._event_start.emit(gb.hour3cut.HOUR_3_CUT_1)
					await get_tree().create_timer(8).timeout
					sb._event_start.emit(gb.hour3cut.HOUR_3_CUT_2)
					cutscene = false
				else:
					sb._event_start.emit(new_event)
			gb.hour4cut:
				var new_event = gb.hour4cut.values()[pm.hour4cuti]
				print(str(Time.get_ticks_msec()) + ": " + str(new_event))
				if pm.hour4cuti < 2:
					cutscene = true
					sb._remote_light_off.emit()
					am._play_cut_music_snippets("Cut_Snip_3.ogg")
					await get_tree().create_timer(8).timeout
					sb._event_start.emit(gb.hour4cut.HOUR_4_CUT_1)
					await get_tree().create_timer(8).timeout
					sb._event_start.emit(gb.hour4cut.HOUR_4_CUT_2)
					cutscene = false
				else:
					sb._event_start.emit(new_event)
			gb.hour5cut:
				var new_event = gb.hour5cut.values()[pm.hour5cuti]
				print(str(Time.get_ticks_msec()) + ": " + str(new_event))
				if pm.hour5cuti < 2:
					cutscene = true
					sb._remote_light_off.emit()
					am._play_cut_music_snippets("Cut_Snip_4.ogg")
					await get_tree().create_timer(8).timeout
					sb._event_start.emit(gb.hour5cut.HOUR_5_CUT_1)
					await get_tree().create_timer(8).timeout
					sb._event_start.emit(gb.hour5cut.HOUR_5_CUT_2)
					cutscene = false
				else:
					sb._event_start.emit(new_event)
			gb.hour1, gb.hour2, gb.hour3, gb.hour4:
				gb.difficulty = gb.difficulty_setting
				print(str(Time.get_ticks_msec()) + ": " + str(gb.difficulty))
				var new_event = er._choose_random_event()
				print(str(Time.get_ticks_msec()) + ": " + str(new_event))
				sb._event_start.emit(new_event)
			gb.hour5:
				if hour5loop:
					gb.difficulty = gb.difficulty_setting
					gb.custom_endless_5_reset = gb.current_hour
					var event = gb._hour5()
					sb._event_start.emit(event)
					await sb._event_finished
					gb.current_hour = gb.hour5
					gb.custom_endless_5_reset = {}
				else:
					gb.hour_5_active = false
					gb.current_hour = gb.end1
					sb._remote_light_off.emit()
					sb._remote_flashlight_off.emit()
					get_tree().call_group("Controls", "_disable_controls")
					queue_free()
			gb.end1:
				gb.hour_5_active = false
				sb._remote_light_off.emit()
				sb._remote_flashlight_off.emit()
				get_tree().call_group("Controls", "_disable_controls")
				queue_free()
			gb.custom_mode:
				gb.difficulty = gb.custom_mode_difficulty
				gb.custom_endless_5_reset = gb.current_hour
				var event = gb._custom_mode()
				sb._event_start.emit(event)
				await sb._event_finished
				gb.current_hour = gb.custom_mode
				gb.custom_endless_5_reset = {}
			gb.endless_mode:
				gb.custom_endless_5_reset = gb.current_hour
				var event = gb._hour5()
				sb._event_start.emit(event)
				await sb._event_finished
				gb.current_hour = gb.endless_mode
				gb.custom_endless_5_reset = {}
			gb.end3:
				var new_event = gb.end3.values()[pm.end3i]
				print(str(Time.get_ticks_msec()) + ": " + str(new_event))
				if pm.end3i < 2:
					cutscene = true
					sb._remote_light_off.emit()
					sb._event_start.emit(gb.end3.END_3_1)
					sb._remote_light_on.emit()
					await get_tree().create_timer(5).timeout
					sb._event_start.emit(gb.end3.END_3_2)
					await get_tree().create_timer(0.65).timeout
					am._play_train_ending()
					await get_tree().create_timer(14.35).timeout
					sb._jumpscare_finished.emit("null")
					await am.finished
					cutscene = false
			gb.demo_sizzle:
				var new_event = gb.demo_sizzle.values()[pm.dsi]
				sb._event_start.emit(new_event)
			gb.trailer:
				sb._remote_light_off.emit()
				sb._event_start.emit(gb.trailer.t1) # Drawing with lights on
				sb._remote_light_on.emit()
				await get_tree().create_timer(4).timeout
				sb._remote_light_off.emit()
				await get_tree().create_timer(0.5).timeout
				sb._event_start.emit(gb.trailer.t2) # Drawing
				await get_tree().create_timer(4).timeout
				sb._event_start.emit(gb.trailer.t3) # Hide and Seek
				await get_tree().create_timer(4).timeout
				sb._event_start.emit(gb.trailer.t4) # Drawing
				await get_tree().create_timer(4).timeout
				sb._event_start.emit(gb.trailer.t5) # Flashlight Tag
				await get_tree().create_timer(4).timeout
				sb._event_start.emit(gb.trailer.t6) # Drawing
				await get_tree().create_timer(4).timeout
				sb._remote_light_off.emit()
				get_tree().call_group("scom", "_set_shadows_only")
				sb._remote_light_on.emit()
				sb._event_start.emit(gb.trailer.t7) # All items missing
				await get_tree().create_timer(3).timeout
				sb._remote_light_off.emit()
				await get_tree().create_timer(.5).timeout
				sb._event_start.emit(gb.trailer.t8) # Drawing
				await get_tree().create_timer(4).timeout
				sb._event_start.emit(gb.trailer.t9) # Drawing
	else:
		var new_event = gb.override_event_target
		print(str(Time.get_ticks_msec()) + ": " + str(new_event))
		print(str(Time.get_ticks_msec()) + ": " + str(new_event) + " is from an active override")
		sb._event_start.emit(new_event)
		

func _event_finished() -> void:
	if not cutscene:
		get_tree().call_group("Controls", "_disable_controls")
		await get_tree().create_timer(randf_range(0.75,1.5), false).timeout
		_start_event()
		
		
func _disable_hour_5_loop() -> void:
	hour5loop = false
