extends Node

var current_hour = hour1

enum hour1 {EVENT_1, EVENT_2, EVENT_3, EVENT_4, EVENT_5, EVENT_6, EVENT_7,
EVENT_8, EVENT_9, EVENT_10}

var events: Dictionary = {"hour1": hour1}

var override_event_target

func _new_override_target(hour_section, event, hours) -> void:
	override_event_target = events[hour_section.text][event]
	print(override_event_target)
	current_hour = events[hour_section.text]
	print(hours)
