extends Node

var current_hour = tutorial:
	get:
		return current_hour
	set(new_hour):
		current_hour = new_hour
		sb._hour_changed.emit(current_hour)

enum tutorial {EVENT_0_0 = 0, EVENT_0_1, EVENT_0_2, EVENT_0_3, EVENT_0_4, EVENT_0_5} 

enum hour1 {EVENT_1_1 = 101,
EVENT_1_2, EVENT_1_3, EVENT_1_4, EVENT_1_5, EVENT_1_6, EVENT_1_7, EVENT_1_8, EVENT_1_9,
EVENT_1_10}

enum hour2 {EVENT_2_1 = 201,
EVENT_2_2, EVENT_2_3, EVENT_2_4, EVENT_2_5, EVENT_2_6, EVENT_2_7, EVENT_2_8, EVENT_2_9,
EVENT_2_10}

var event_dict: Dictionary = {
	"tutorial": tutorial,
	"hour1": hour1,
	"hour2": hour2
}


var override_event_target

func _new_override_target(hour_section, event, hours) -> void:
	current_hour = event_dict[hours]
	override_event_target = event_dict[hour_section.text][event]

var vis_effects
