extends Node

signal finished

var tutoriali: int = 0
var tutorialmax: int = 5

var hour1i: int = 0
var hour1max: int = 10

var hour2i: int = 0
var hour2max: int = 10

var hour3i: int = 0
var hour3max: int = 10

var hour4i: int = 0
var hour4max: int = 10

var hour5i: int = 0
var hour5max: int = 20

var customi: int = 0
var custommax: int = 0


func _ready() -> void:
	sb._event_start.connect(_event_start)


func _event_start(event) -> Signal:
	if gb.override_event_target != null:
		pass
	match gb.current_hour:
		gb.tutorial:
			await sb._event_finished
			if tutoriali == tutorialmax:
				gb.current_hour = gb.hour1
			else:
				tutoriali += 1
		gb.hour1:
			await sb._event_finished
			if hour1i == hour1max:
				gb.current_hour = gb.hour2
			else:
				hour1i += 1
		gb.hour2:
			await sb._event_finished
			if hour2i == hour2max:
				gb.current_hour = gb.hour3
			else:
				hour2i += 1
		gb.hour3:
			await sb._event_finished
			if hour3i == hour3max:
				gb.current_hour = gb.hour4
			else:
				hour3i += 1
		gb.hour4:
			await sb._event_finished
			if hour4i == hour4max:
				gb.current_hour = gb.hour5
			else:
				hour4i += 1
		gb.hour5:
			await sb._event_finished
			if hour5i == hour5max:
				## TODO: Change this!
				gb.current_hour = gb.tutorial
			else:
				hour5i += 1
	return finished
