extends Node

signal finished

var amb1: AudioStreamPlayer
var amb2: AudioStreamPlayer

var footstep_fx: Array = ResourceLoader.list_directory("res://audio/Footsteps/")
var bassy_fx: Array = ResourceLoader.list_directory("res://audio/Bassy/")
var scrape_fx: Array = ResourceLoader.list_directory("res://audio/Scrapes/")
var stinger_fx: Array = ResourceLoader.list_directory("res://audio/Stingers/")

func _ready() -> void:
	_start_ambience()
	sb._event_start.connect(_event_start)
	sb._event_finished.connect(_event_end)

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
	match event:
		_:
			_play_footsteps()
			if randi_range(1,10) == 1:
				_play_bassy()
			if randi_range(1,10) == 1:
				_play_scrapes()

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
	
func _play_bassy() -> void:
	var random_id = randi_range(1,1000000)
	var stream = AudioStreamPlayer.new()
	add_child(stream)
	var file = "res://audio/Bassy/" + bassy_fx.pick_random()
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
	
func _play_stingers() -> void:
	var random_id = randi_range(1,1000000)
	var stream = AudioStreamPlayer.new()
	add_child(stream)
	var file = "res://audio/Stingers/" + stinger_fx.pick_random()
	print(file)
	stream.stream = load(file)
	stream.volume_db = -10
	stream.play()
	stream.name += str(random_id)
	stream.add_to_group("Stingers")
	stream.add_to_group("SFX")
	await stream.finished
	remove_child(stream)
