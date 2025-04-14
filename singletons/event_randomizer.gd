extends Node

var hour1dict: Dictionary
var hour2dict: Dictionary
var hour3dict: Dictionary
var hour4dict: Dictionary
var hour5dict: Dictionary
var rng: RandomNumberGenerator = RandomNumberGenerator.new()

func _ready() -> void:
	for event in gb.hour1.values():
		hour1dict.get_or_add(event, 1)
	for event in gb.hour2.values():
		hour2dict.get_or_add(event, 1)
	for event in gb.hour3.values():
		hour3dict.get_or_add(event, 1)
	for event in gb.hour4.values():
		hour4dict.get_or_add(event, 1)
	hour5dict = {gb.hour1: 1, gb.hour2: 1, gb.hour3: 1, gb.hour4: 1}

	

func _choose_random_event() -> int:
	match gb.current_hour:
		gb.hour1:
			return _choose_and_manipulate(hour1dict)
		gb.hour2:
			return _choose_and_manipulate(hour2dict)
		gb.hour3:
			return _choose_and_manipulate(hour3dict)
		gb.hour4:
			return _choose_and_manipulate(hour4dict)
	return -1

func _choose_and_manipulate(dict) -> int:
	var event = dict.keys()[rng.rand_weighted(dict.values())]
	for events in dict.keys():
		if events == event:
			dict[events] -= 0.5
		else:
			if dict[events] < 1:
				dict[events] += 0.25
	return event

func _hour5_pick() -> Dictionary:
	var choice = hour5dict.keys()[rng.rand_weighted(hour5dict.values())]
	for hour in hour5dict.keys():
		if hour == choice:
			hour5dict[hour] -= 0.25
		else:
			if hour5dict[hour] < 1:
				hour5dict[hour] += 0.25
	print(hour5dict)
	return choice
