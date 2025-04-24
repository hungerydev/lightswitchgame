extends Node
class_name GlobalVariables

var difficulty_setting: float = 1.0
var difficulty_default: float = 1.0
var difficulty: float = 1.0

var control: bool = true

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

var hour_5_active: bool = false

var fail: bool = false:
	get:
		return fail
	set(new_value):
		fail = new_value
		if new_value == true:
			sb._fail.emit()

enum tutorial {EVENT_0_0 = 0, EVENT_0_1, EVENT_0_2, EVENT_0_3, EVENT_0_4, EVENT_0_5} 

enum hour1 {EVENT_1_1 = 101,
EVENT_1_2, EVENT_1_3, EVENT_1_4, EVENT_1_5, EVENT_1_6, EVENT_1_7, EVENT_1_8, EVENT_1_9,
EVENT_1_10}

enum hour2cut {HOUR_2_CUT_1 = 251, HOUR_2_CUT_2, HOUR_2_CUT_3, HOUR_2_CUT_4, HOUR_2_CUT_5}

enum hour2 {EVENT_2_1 = 201,
EVENT_2_2, EVENT_2_3, EVENT_2_4, EVENT_2_5, EVENT_2_6, EVENT_2_7, EVENT_2_8, EVENT_2_9,
EVENT_2_10}

enum hour3cut {HOUR_3_CUT_1 = 351, HOUR_3_CUT_2, HOUR_3_CUT_3, HOUR_3_CUT_4}

enum hour3 {EVENT_3_1 = 301, 
EVENT_3_2, EVENT_3_3, EVENT_3_4, EVENT_3_5, EVENT_3_6, EVENT_3_7, EVENT_3_8, EVENT_3_9, 
EVENT_3_10}

enum hour4cut {HOUR_4_CUT_1 = 451, HOUR_4_CUT_2, HOUR_4_CUT_3, HOUR_4_CUT_4, HOUR_4_CUT_5, HOUR_4_CUT_6}

enum hour4 {EVENT_4_1 = 401, 
EVENT_4_2, EVENT_4_3, EVENT_4_4, EVENT_4_5, EVENT_4_6, EVENT_4_7, EVENT_4_8, EVENT_4_9,
EVENT_4_10, EVENT_4_11, EVENT_4_12, EVENT_4_13, EVENT_4_14, EVENT_4_15}

enum hour5cut {HOUR_5_CUT_1 = 551, HOUR_5_CUT_2, HOUR_5_CUT_3, HOUR_5_CUT_4}

enum hour5 {HOUR_5 = 501}

enum end1 {END_1_1 = 901, END_1_2, END_1_3, END_1_4}

enum credits {CRED_1 = 651, CRED_2, CRED_3, CRED_4}

enum post_game {POST_GAME = 601}

enum custom_mode {CUSTOM_MODE = 701}

enum end2 {END_2_1 = 1001, END_2_2, END_2_3}

enum endless_mode {ENDLESS_MODE = 801}

enum end3 {END_3_1 = 1101, END_3_2}

var event_dict: Dictionary = {
	"tutorial": tutorial,
	"hour1": hour1,
	"hour2cut": hour2cut,
	"hour2": hour2,
	"hour3cut": hour3cut,
	"hour3": hour3,
	"hour4cut": hour4cut,
	"hour4": hour4,
	"hour5cut": hour5cut,
	"hour5": hour5,
	"end1": end1,
	"credits": credits, 
	"post_game": post_game,
	"custom_mode": custom_mode, 
	"end2": end2,
	"endless_mode": endless_mode,
	"end3": end3
}

	
func _hour5() -> int:
	hour_5_active = true
	var hour5_pick = er._hour5_pick()
	current_hour = hour5_pick
	var event = er._choose_random_event()
	return event

func _custom_mode() -> int:
	var custom_pick = er._custom_pick()
	current_hour = custom_pick
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
	death = true
	fail = false
	loading = false
