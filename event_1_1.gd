extends Node

func _trigger_event_start():
	SignalBus._event_1_1.emit()
	if randi_range(1, 1) == 1:
		AudioManager._play_bassy()
	if randi_range(1, 1) == 1:
		AudioManager._play_scrapes()
	await AudioManager._play_footsteps()
	print("sound is finished")
