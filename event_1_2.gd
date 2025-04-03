extends Node

func _trigger_event_start():
	SignalBus._event_start.emit(GlobalVariables.EVENT_1_2)
	if randi_range(1, 5) == 1:
		AudioManager._play_bassy()
	if randi_range(1, 5) == 1:
		AudioManager._play_scrapes()
	await AudioManager._play_footsteps()
