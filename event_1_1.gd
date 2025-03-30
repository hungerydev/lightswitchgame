extends Node

func _trigger_event_start():
	SignalBus._event_1_1.emit()
	await AudioManager._play_footsteps()
	print("sound is finished")
