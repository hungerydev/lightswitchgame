extends Node
class_name GlobalFunctions

var perf_chance: bool = false
var chance_setting: float = 1.0
var chance_default: float = 1.0
var chance_modifier: float = clamp(1.0, 0.01, chance_setting):
	get:
		return chance_modifier
	set(value):
		chance_modifier = clamp(value, 0.01, chance_setting)
		print(str(Time.get_ticks_msec()) + ": " + "Current chance modifier: " + str(chance_modifier))
var chance_reducer: float = 0.020

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_PAUSABLE
	if gb.demo_mode:
		chance_default = 0.7
	chance_setting = chance_default
	sb._monster_inactive.connect(_death_timer)
	sb._event_start.connect(_set_death_timer_dur)

func _rc_easy() -> bool: ## 1 in 10
	if randi_range(1, 10) == 1:
		return true
	elif perf_chance:
		return true
	else:
		return false
		

func _rc_medium() -> bool: ## 1 in 25
	if randi_range(1, 25) == 1:
		return true
	elif perf_chance:
		return true
	else:
		return false
		
func _rc_hard() -> bool: ## 1 in 50
	if randf_range(1, clamp(50 * chance_modifier, 1, 50)) == 1:
		chance_modifier += .5
		return true
	elif perf_chance:
		return true
	else:
		chance_modifier -= chance_reducer
		return false

func _rc_very_hard() -> bool: ## 1 in 100
	if randf_range(1, clamp(100 * chance_modifier, 1, 100)) == 1:
		chance_modifier += .5
		return true
	elif perf_chance:
		return true
	else:
		chance_modifier -= chance_reducer
		return false
		
func _rc_impossible() -> bool: ## 1 in 1000
	if randf_range(1, clamp(1000 * chance_modifier, 1, 1000)) == 1:
		chance_modifier += .5
		return true
	elif perf_chance:
		return true
	else:
		chance_modifier -= chance_reducer
		return false

var death_timer: float = 5.0

func _set_death_timer_dur(event) -> void:
	match gb.current_hour:
		gb.hour1:
			death_timer = 5.0
		gb.hour2:
			death_timer = 7.0
		gb.hour3:
			death_timer = 2.0
		gb.hour4:
			death_timer = 10.0

func _death_timer() -> void:
	var timer = get_tree().create_timer(clamp(death_timer * gb.difficulty, 1, death_timer), false)
	print(str(Time.get_ticks_msec()) + ": " + "Death timer started")
	timer.timeout.connect(_too_slow)
	await sb._event_finished
	timer.timeout.disconnect(_too_slow)
	
func _too_slow() -> void:
	print(str(Time.get_ticks_msec()) + ": " + "Death timer timed out!")
	sb._time_fail.emit("slow")
