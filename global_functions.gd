extends Node

var perf_chance: bool = false

func _ready() -> void:
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
	if randi_range(1, 50) == 1:
		return true
	elif perf_chance:
		return true
	else:
		return false

func _rc_very_hard() -> bool: ## 1 in 100
	if randi_range(1, 100) == 1:
		return true
	elif perf_chance:
		return true
	else:
		return false
		
func _rc_impossible() -> bool: ## 1 in 1000
	if randi_range(1, 1000) == 1:
		return true
	elif perf_chance:
		return true
	else:
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

func _death_timer() -> void:
	var timer = get_tree().create_timer(death_timer * gb.difficulty)
	print("Death timer started")
	timer.timeout.connect(_too_slow)
	await sb._event_finished
	timer.timeout.disconnect(_too_slow)
	
func _too_slow() -> void:
	print("Death timer timed out!")
	sb._time_fail.emit()
