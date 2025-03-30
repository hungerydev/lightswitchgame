extends Node

func _trigger_event_start():
	SignalBus._event_1_2.emit()
