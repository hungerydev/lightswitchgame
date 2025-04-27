extends Node

signal finished

var tutoriali: int = 0
var tutorialmax: int = 5

var hour1i: int = 0
var hour1max: int = 10

var hour2cuti: int = 0
var hour2cutmax: int = 4

var hour2i: int = 0
var hour2max: int = 10

var hour3cuti: int = 0
var hour3cutmax: int = 3

var hour3i: int = 0
var hour3max: int = 10

var hour4cuti: int = 0
var hour4cutmax: int = 5

var hour4i: int = 0
var hour4max: int = 10

var hour5cuti: int = 0
var hour5cutmax: int = 3

var hour5i: int = 0
var hour5max: int = 20

var end1i: int = 0
var end1max: int = 4

var crediti: int = 0
var creditmax: int = 0

var customi: int = 0
var custommax: int = 20

var endlessi := 0
var endlessmax := 999

var end3i: int = 0
var end3max: int = 2


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
				gb.last_hour_completed = gb.tutorial
			else:
				tutoriali += 1
		gb.hour1:
			await sb._event_finished
			if hour1i == hour1max:
				gb.current_hour = gb.hour2cut
				gb.last_hour_completed = gb.hour1
			else:
				hour1i += 1
		gb.hour2cut:
			await sb._event_finished
			if hour2cuti == hour2cutmax:
				gb.current_hour = gb.hour2
				gb.last_hour_completed = gb.hour1
			else:
				hour2cuti += 1
		gb.hour2:
			await sb._event_finished
			if hour2i == hour2max:
				gb.current_hour = gb.hour3
				gb.last_hour_completed = gb.hour2
			else:
				hour2i += 1
		gb.hour3cut:
			await sb._event_finished
			if hour3cuti == hour3cutmax:
				gb.current_hour = gb.hour3
				gb.last_hour_completed = gb.hour2
			else:
				hour3cuti += 1
		gb.hour3:
			await sb._event_finished
			if hour3i == hour3max:
				gb.current_hour = gb.hour4cut      
				gb.last_hour_completed = gb.hour3
			else:
				hour3i += 1
		gb.hour4cut:
			await sb._event_finished
			if hour4cuti == hour4cutmax:
				gb.current_hour = gb.hour4
				gb.last_hour_completed = gb.hour3
			else:
				hour4cuti += 1
		gb.hour4:
			await sb._event_finished
			if hour4i == hour4max:
				gb.current_hour = gb.hour5
				gb.last_hour_completed = gb.hour4
			else:
				hour4i += 1
		gb.hour5cut:
			await sb._event_finished
			if hour5cuti == hour5cutmax:
				gb.current_hour = gb.hour5
				gb.last_hour_completed = gb.hour4
			else:
				hour5cuti += 1
		gb.hour5:
			if hour5i == hour5max:
				gb.current_hour = gb.post_game
				gb.last_hour_completed = gb.hour5
			else:
				hour5i += 1
		gb.custom_mode:
			if customi == custommax:
				gb.current_hour = gb.post_game
			else:
				customi += 1
		gb.endless_mode:
			if endlessi == 25:
				gb.difficulty = 0.7
			elif endlessi == 50:
				gb.difficulty = 0.5
			elif endlessi == 75:
				gb.difficulty = 0.3
			elif endlessi == 100:
				gb.difficulty = 0.1
			endlessi += 1
		gb.end3:
			if end3i == end3max:
				pass
			else:
				end3i += 1
	return finished
