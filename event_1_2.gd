extends Node

func _trigger_event_start():
	sb._event_start.emit(gb.EVENT_1_2)
	if randi_range(1, 5) == 1:
		am._play_bassy()
	if randi_range(1, 5) == 1:
		am._play_scrapes()
	await am._play_footsteps()
