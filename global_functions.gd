extends Node

var perf_chance: bool = false

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
