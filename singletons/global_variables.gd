extends Node
class_name GlobalVariables

var difficulty_setting: float = 1.0
var difficulty: float = 1.0

var loading: bool = false

var death: bool = true

var last_hour_completed = null

var current_hour = tutorial:
	get:
		return current_hour
	set(new_hour):
		if not loading:
			last_hour_completed = current_hour
		current_hour = new_hour
		sb._hour_changed.emit(current_hour)

var fail: bool = false:
	get:
		return fail
	set(new_value):
		fail = new_value
		sb._fail.emit()

enum tutorial {EVENT_0_0 = 0, EVENT_0_1, EVENT_0_2, EVENT_0_3, EVENT_0_4, EVENT_0_5} 

enum hour1 {EVENT_1_1 = 101,
EVENT_1_2, EVENT_1_3, EVENT_1_4, EVENT_1_5, EVENT_1_6, EVENT_1_7, EVENT_1_8, EVENT_1_9,
EVENT_1_10}

enum hour2 {EVENT_2_1 = 201,
EVENT_2_2, EVENT_2_3, EVENT_2_4, EVENT_2_5, EVENT_2_6, EVENT_2_7, EVENT_2_8, EVENT_2_9,
EVENT_2_10}

enum hour3 {EVENT_3_1 = 301, 
EVENT_3_2, EVENT_3_3, EVENT_3_4, EVENT_3_5, EVENT_3_6, EVENT_3_7, EVENT_3_8, EVENT_3_9, 
EVENT_3_10}

enum hour4 {EVENT_4_1 = 401, 
EVENT_4_2, EVENT_4_3, EVENT_4_4, EVENT_4_5, EVENT_4_6, EVENT_4_7, EVENT_4_8, EVENT_4_9,
EVENT_4_10, EVENT_4_11, EVENT_4_12, EVENT_4_13, EVENT_4_14, EVENT_4_15}

enum hour5 {}

enum post_game {}

var event_dict: Dictionary = {
	"tutorial": tutorial,
	"hour1": hour1,
	"hour2": hour2,
	"hour3": hour3,
	"hour4": hour4,
	"hour5": hour5
}

func _hour5() -> int:
	var hour5_pick = er._hour5_pick()
	current_hour = hour5_pick
	var event = er._choose_random_event()
	return event

var override_event_target

func _new_override_target(hour_section, event, hours) -> void:
	current_hour = event_dict[hours]
	override_event_target = event_dict[hour_section.text][event]

var vis_effects

func _save() -> Dictionary:
	var save_dict = {
		"last_hour_completed": last_hour_completed,
		"difficulty_setting": difficulty_setting,
		"string": "looks like it worked"
	}
	return save_dict

func _load(data) -> void:
	loading = true
	var last_hour: Dictionary = data["last_hour_completed"]
	match last_hour.values().get(0):
		0.0:
			last_hour_completed = tutorial
			current_hour = tutorial
			
		101.0:
			last_hour_completed = hour1
			current_hour = hour2
			
		201.0:
			last_hour_completed = hour2
			current_hour = hour3
			
		301.0:
			last_hour_completed = hour3
			current_hour = hour4
			
		401.0:
			last_hour_completed = hour4
			current_hour = hour5
			
		501.0:
			last_hour_completed = hour5
			current_hour = post_game
	difficulty_setting = data["difficulty_setting"]
	loading = false
