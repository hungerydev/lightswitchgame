extends Node

var hour1dict: Dictionary
var hour2dict: Dictionary
var hour3dict: Dictionary
var hour4dict: Dictionary
var hour5dict: Dictionary
var customdict: Dictionary
var rng: RandomNumberGenerator = RandomNumberGenerator.new()

func _ready() -> void:
	sb._event_start.connect(_rcs_defer)
	for event in gb.hour1.values():
		hour1dict.get_or_add(event, 1)
	for event in gb.hour2.values():
		hour2dict.get_or_add(event, 1)
	for event in gb.hour3.values():
		hour3dict.get_or_add(event, 1)
	for event in gb.hour4.values():
		hour4dict.get_or_add(event, 1)
	hour5dict = {gb.hour1: 1, gb.hour2: 1, gb.hour3: 1, gb.hour4: 1}

func _rcs_defer(_event) -> void:
	call_deferred("_random_chance_selection")

func _random_chance_selection() -> void:
	var entities = get_tree().get_nodes_in_group("Entity")
	entities.shuffle()
	for entity in entities:
		if entity.chance_active == true:
			print("Calling random chance event on " + str(entity))
			entity.call("_random_chance")
			entity.chance_active = false


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

func _create_custom_dict(selections) -> void:
	var key_array: Array
	for i in selections:
		match i:
			0:
				key_array.append(gb.hour1)
			1:
				key_array.append(gb.hour2)
			2:
				key_array.append(gb.hour3)
			3:
				key_array.append(gb.hour4)
	for hour in key_array:
		customdict.get_or_add(hour, 1)

func _custom_pick() -> Dictionary:
	var choice = customdict.keys()[rng.rand_weighted(customdict.values())]
	for hour in customdict.keys():
		if hour == choice:
			customdict[hour] -= 0.25
		else:
			if customdict[hour] < 1:
				customdict[hour] += 0.25
	print(customdict)
	return choice
				
