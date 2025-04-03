extends Node

func _trigger_event_start():
	sb._event_start.emit(gb.EVENT_1_1)
	if randi_range(1, 5) == 1:
		am._play_bassy()
	if randi_range(1, 5) == 1:
		am._play_scrapes()
	await am._play_footsteps()
	print("sound is finished")
