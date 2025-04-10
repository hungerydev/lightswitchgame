extends Node

signal finished

var monster_active: bool = false:
	get:
		return monster_active
	set(new_value):
		monster_active = new_value
		if monster_active == false:
			sb._monster_inactive.emit()

var amb1: AudioStreamPlayer
var amb2: AudioStreamPlayer

var footstep_fx: Array = ResourceLoader.list_directory("res://audio/Footsteps/")
var bassy_fx: Array = ResourceLoader.list_directory("res://audio/Bassy/")
var scrape_fx: Array = ResourceLoader.list_directory("res://audio/Scrapes/")
var stinger_fx: Array = ResourceLoader.list_directory("res://audio/Stingers/")
var jumpscare_fx: Array = ResourceLoader.list_directory("res://audio/Jumpscares")

func _ready() -> void:
	_start_ambience()
	sb._event_start.connect(_event_start)
	sb._event_finished.connect(_event_end)
	sb._light_on.connect(_switch_ambience_light_on)
	sb._light_off.connect(_switch_ambience_light_off)
	sb._fail.connect(_fail)

func _start_ambience() -> void:
	amb1 = AudioStreamPlayer.new()
	amb2 = AudioStreamPlayer.new()
	add_child(amb1)
	add_child(amb2)
	amb1.stream = load("res://audio/Room Tone and Ambience/rta1.ogg")
	amb2.stream = load("res://audio/Room Tone and Ambience/rta2.ogg")
	amb1.volume_db = -100
	amb2.volume_db = -5
	amb1.add_to_group("Ambience")
	amb2.add_to_group("Ambience")
	amb1.play()
	amb2.play()

func _switch_ambience_light_off() -> void:
	amb1.volume_db = -5
	amb2.volume_db = -100

func _switch_ambience_light_on() -> void:
	amb1.volume_db = -100
	amb2.volume_db = -5

func _play_sound(sound: String) -> void:
	var stream = AudioStreamPlayer.new()
	add_child(stream)
	stream.stream = load(sound)
	stream.play()
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("DEBUG_play_footsteps"):
		_play_sound("uid://mcoulh5ae16j")

func _event_start(event) -> void:
	await sb._light_off
	match gb.current_hour:
		gb.tutorial:
			match event:
				gb.tutorial.EVENT_0_0, gb.tutorial.EVENT_0_1, gb.tutorial.EVENT_0_2, gb.tutorial.EVENT_0_4, gb.tutorial.EVENT_0_5:
					pass
				gb.tutorial.EVENT_0_3:
					await _play_footsteps()
					sb._event_finished.emit()
		gb.hour1, gb.hour2:
			match event:
				_:
					monster_active = true
					if randi_range(1,10) == 1:
						_play_bassy("none")
					if randi_range(1,10) == 1:
						_play_scrapes()
					await _play_footsteps()
					monster_active = false
		gb.hour3:
			match event:
				_:
					pass

func _event_end() -> void:
	for child in get_children():
		if child.is_in_group("SFX"):
			child.queue_free()

func _play_footsteps() -> Signal:
	var random_id = randi_range(1,1000000)
	var stream = AudioStreamPlayer.new()
	add_child(stream)
	var file = "res://audio/Footsteps/" + footstep_fx.pick_random()
	print(file)
	stream.stream = load(file)
	stream.volume_db = -25
	stream.play()
	stream.name += str(random_id)
	stream.add_to_group("Footsteps")
	stream.add_to_group("SFX")
	await stream.finished
	remove_child(stream)
	return finished
	
func _play_bassy(string) -> void:
	var file: String
	var random_id = randi_range(1,1000000)
	var stream = AudioStreamPlayer.new()
	add_child(stream)
	if string == "none":
		file = "res://audio/Bassy/" + bassy_fx.pick_random()
	else:
		file = "res://audio/Bassy/" + string
	print(file)
	stream.stream = load(file)
	stream.volume_db = 0
	stream.pitch_scale = 0.5
	stream.play()
	stream.name += str(random_id)
	stream.add_to_group("Bassy")
	stream.add_to_group("SFX")
	await stream.finished
	remove_child(stream)

func _play_scrapes() -> void:
	var random_id = randi_range(1,1000000)
	var stream = AudioStreamPlayer.new()
	add_child(stream)
	var file = "res://audio/Scrapes/" + scrape_fx.pick_random()
	print(file)
	stream.stream = load(file)
	stream.volume_db = 5
	stream.play()
	stream.name += str(random_id)
	stream.add_to_group("Scrapes")
	stream.add_to_group("SFX")
	await stream.finished
	remove_child(stream)
	
func _play_stingers(string: String) -> void:
	var file: String
	var random_id = randi_range(1,1000000)
	var stream = AudioStreamPlayer.new()
	add_child(stream)
	if string == "none":
		file = "res://audio/Stingers/" + stinger_fx.pick_random()
	else:
		file = "res://audio/Stingers/" + string
	print(file)
	stream.stream = load(file)
	stream.volume_db = -10
	stream.play()
	stream.name += str(random_id)
	stream.add_to_group("Stingers")
	stream.add_to_group("SFX")
	await stream.finished
	remove_child(stream)

func _play_jumpscare(string) -> void:
	var file: String
	var random_id = randi_range(1,1000000)
	var stream = AudioStreamPlayer.new()
	add_child(stream)
	if string == "none":
		file = "res://audio/Jumpscares/" + jumpscare_fx.pick_random()
	else:
		file = "res://audio/Jumpscares/" + string
	print(file)
	stream.stream = load(file)
	stream.volume_db = -3
	stream.play()
	stream.name += str(random_id)
	stream.add_to_group("Jumpscares")
	stream.add_to_group("SFX")
	await stream.finished
	remove_child(stream)

func _fail() -> void:
	for child in get_children():
		child.queue_free()
	_play_jumpscare("js2.ogg")
	_play_stingers("stinger4.ogg")
	_play_bassy("bass2.ogg")
	
func _time_fail() -> void:
	pass
	
	
