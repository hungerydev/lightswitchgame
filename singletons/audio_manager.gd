extends Node
class_name AudioManager

@onready var ar: AudioRandomizer = $audio_randomizer

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
var amb3: AudioStreamPlayer

var footstep_fx: Array = ResourceLoader.list_directory("res://audio/Footsteps/")
var fs_slow: Array = ResourceLoader.list_directory("res://audio/Footsteps/Slow/")
var fs_medium: Array = ResourceLoader.list_directory("res://audio/Footsteps/Medium/")
var fs_fast: Array = ResourceLoader.list_directory("res://audio/Footsteps/Fast/")

var bassy_fx: Array = ResourceLoader.list_directory("res://audio/Bassy/")

var scrape_fx: Array = ResourceLoader.list_directory("res://audio/Scrapes/")

var stinger_fx: Array = ResourceLoader.list_directory("res://audio/Stingers/")

var jumpscare_fx: Array = ResourceLoader.list_directory("res://audio/Jumpscares")

var ls_fx_on: Array = ResourceLoader.list_directory("res://audio/Lightswitch/On/")
var ls_fx_off: Array = ResourceLoader.list_directory("res://audio/Lightswitch/Off/")
var use_lightbulb_fx: bool = true

var flashlight_fx: Array = ResourceLoader.list_directory("res://audio/Flashlight/")
var use_flashlight_fx: bool = false

var thun_fx: Array = ResourceLoader.list_directory("res://audio/Thunder/")

var rain_amb: Array = ResourceLoader.list_directory("res://audio/Rain/")
var raining: bool = false

var robot_fx: Array = ResourceLoader.list_directory("res://audio/Robot/")

var sigh_fx: Array = ResourceLoader.list_directory("res://audio/Sighs/")

var growl_fx: Array = ResourceLoader.list_directory("res://audio/Growls/")

func _ready() -> void:
	_start_ambience()
	sb._event_start.connect(_event_start)
	sb._event_finished.connect(_event_end)
	sb._fail.connect(_fail)
	sb._hour_changed.connect(_hour_changed)
	sb._monster_clicked.connect(_play_sigh_fx)

func _start_ambience() -> void:
	amb1 = AudioStreamPlayer.new()
	amb2 = AudioStreamPlayer.new()
	amb3 = AudioStreamPlayer.new()
	add_child(amb1)
	add_child(amb2)
	add_child(amb3)
	amb1.stream = load("res://audio/Room Tone and Ambience/rta1.ogg")
	amb2.stream = load("res://audio/Room Tone and Ambience/rta2.ogg")
	amb3.stream = load("res://audio/Room Tone and Ambience/nightamb.ogg")
	amb1.volume_db = -100
	amb2.volume_db = -5
	amb3.volume_db = -10
	amb1.add_to_group("Ambience")
	amb2.add_to_group("Ambience")
	amb3.add_to_group("Ambience")
	amb1.play()
	amb2.play()
	amb3.play()

func _hour_changed(event) -> void:
	if not gb.hour_5_active:
		match gb.current_hour:
			gb.hour1:
				use_lightbulb_fx = true
				if raining:
					_stop_rain()
			gb.hour2cut:
				use_lightbulb_fx = false
				if not raining:
					_start_rain()
			gb.hour2:
				use_lightbulb_fx = false
				if not raining:
					_start_rain()
			gb.hour3cut:
				use_lightbulb_fx = false
				if not raining:
					_start_rain()
			gb.hour3:
				use_lightbulb_fx = false
				if not raining:
					_start_rain()
			gb.hour4:
				use_lightbulb_fx = true
				if raining:
					_stop_rain()
		use_flashlight_fx = !use_lightbulb_fx
		

func _start_rain() -> void:
	var random_id = randi_range(1,1000000)
	var stream = AudioStreamPlayer.new()
	add_child(stream)
	var file = "res://audio/Rain/rainamb1.ogg"
	print(file)
	stream.stream = load(file)
	stream.volume_db = -80
	var tween = get_tree().create_tween()
	tween.tween_property(stream, "volume_db",-8,4)
	stream.play()
	stream.name += str(random_id)
	stream.add_to_group("Rain")
	raining = true

	

func _stop_rain() -> void:
	for child in get_children():
		if child.is_in_group("Rain"):
			var tween = get_tree().create_tween()
			await tween.tween_property(child, "volume_db", -80, 2).finished
			child.queue_free()
	raining = false

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
	

func _event_start(event) -> void:
	match gb.current_hour:
		gb.tutorial:
			match event:
				gb.tutorial.EVENT_0_0, gb.tutorial.EVENT_0_1, gb.tutorial.EVENT_0_2, gb.tutorial.EVENT_0_4, gb.tutorial.EVENT_0_5:
					pass
				gb.tutorial.EVENT_0_3:
					await _play_footsteps("none")
					sb._event_finished.emit()
		gb.hour1, gb.hour2:
			match event:
				_:
					await sb._light_off
					monster_active = true
					if randi_range(1,10) == 1:
						_play_bassy("none")
					if randi_range(1,10) == 1:
						_play_scrapes("none")
					if randi_range(1,10) == 1:
						_play_growls()
					await _play_footsteps("none")
					monster_active = false
		gb.hour3:
			match event:
				_:
					pass
		gb.hour4:
			match event:
				_:
					await sb._light_off
					monster_active = true
					if randi_range(1,10) == 1:
						_play_bassy("none")
					if randi_range(1,10) == 1:
						_play_scrapes("none")
					if randi_range(1,10) == 1:
						_play_growls()
					await _play_footsteps("none")
					monster_active = false

func _event_end() -> void:
	for child in get_children():
		if child.is_in_group("SFX"):
			child.queue_free()

func _play_ls_off() -> void:
	if use_lightbulb_fx:
		var random_id = randi_range(1,1000000)
		var stream = AudioStreamPlayer.new()
		add_child(stream)
		var file = ar._choose_ls_off()
		print(file)
		stream.stream = load(file)
		stream.volume_db = -10
		stream.play()
		stream.name += str(random_id)
		stream.add_to_group("Lightswitch")
		stream.add_to_group("SFX")
		await stream.finished
		remove_child(stream)

func _play_ls_on() -> void:
	if use_lightbulb_fx:
		var random_id = randi_range(1,1000000)
		var stream = AudioStreamPlayer.new()
		add_child(stream)
		var file = ar._choose_ls_on()
		print(file)
		stream.stream = load(file)
		stream.volume_db = -10
		stream.play()
		stream.name += str(random_id)
		stream.add_to_group("Lightswitch")
		stream.add_to_group("SFX")
		await stream.finished
		remove_child(stream)

func _play_flashlight_fx() -> void:
	if use_flashlight_fx:
		var random_id = randi_range(1,1000000)
		var stream = AudioStreamPlayer.new()
		add_child(stream)
		var file = "res://audio/Flashlight/" + flashlight_fx.pick_random()
		print(file)
		stream.stream = load(file)
		stream.volume_db = 0
		stream.play()
		stream.name += str(random_id)
		stream.add_to_group("Flashlight")
		stream.add_to_group("SFX")
		await stream.finished
		remove_child(stream)

func _play_footsteps(string) -> Signal:
	var file: String
	var random_id = randi_range(1,1000000)
	var stream = AudioStreamPlayer.new()
	add_child(stream)
	if string == "none":
		file = ar._choose_footstep()
	print(file)
	stream.stream = load(file)
	stream.volume_db = -5
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

func _play_scrapes(string) -> void:
	var file
	var random_id = randi_range(1,1000000)
	var stream = AudioStreamPlayer.new()
	add_child(stream)
	if string == "none":
		file = "res://audio/Scrapes/" + scrape_fx.pick_random()
	else:
		file = "res://audio/Scrapes/" + string
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
	stream.bus = "Jumpscares"
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
	stream.bus = "Jumpscares"
	stream.play()
	stream.name += str(random_id)
	stream.add_to_group("Jumpscares")
	stream.add_to_group("SFX")
	await stream.finished
	remove_child(stream)
	
func _play_thun() -> void:
	var random_id = randi_range(1,1000000)
	var stream = AudioStreamPlayer.new()
	add_child(stream)
	var file = ar._choose_thun()
	print(file)
	stream.stream = load(file)
	stream.volume_db = -5
	stream.play()
	stream.name += str(random_id)
	stream.add_to_group("Thunder")
	await stream.finished
	remove_child(stream)

func _play_train_short() -> void:
	var random_id = randi_range(1,1000000)
	var stream = AudioStreamPlayer.new()
	add_child(stream)
	var file = "res://audio/TrainHorn/trainhornshort.ogg"
	print(file)
	stream.stream = load(file)
	stream.volume_db = -5
	stream.play()
	stream.name += str(random_id)
	stream.add_to_group("TrainShort")
	stream.add_to_group("SFX")
	await stream.finished
	remove_child(stream)

func _play_train_ending() -> Signal:
	var random_id = randi_range(1,1000000)
	var stream = AudioStreamPlayer.new()
	add_child(stream)
	var file = "res://audio/TrainHorn/trainend.ogg"
	print(file)
	stream.stream = load(file)
	stream.volume_db = -5
	stream.play()
	stream.name += str(random_id)
	stream.add_to_group("TrainEnd")
	stream.add_to_group("SFX")
	await stream.finished
	remove_child(stream)
	return finished

func _play_robot() -> void:
	var random_id = randi_range(1,1000000)
	var stream = AudioStreamPlayer.new()
	add_child(stream)
	var file = "res://audio/Robot/" + robot_fx.pick_random()
	print(file)
	stream.stream = load(file)
	stream.volume_db = +3
	stream.play()
	stream.name += str(random_id)
	stream.add_to_group("Robot")
	stream.add_to_group("SFX")
	await stream.finished
	remove_child(stream)

func _play_lightbulb_shatter() -> void:
	var random_id = randi_range(1,1000000)
	var stream = AudioStreamPlayer.new()
	add_child(stream)
	var file = "res://audio/Lightbulb Shatter/glass_break.ogg"
	print(file)
	stream.stream = load(file)
	stream.volume_db = -5
	stream.play()
	stream.name += str(random_id)
	stream.add_to_group("SFX")
	stream.add_to_group("LightbulbShatter")
	await stream.finished
	remove_child(stream)
	
func _play_sigh_fx() -> void:
	var random_id = randi_range(1,1000000)
	var stream = AudioStreamPlayer.new()
	add_child(stream)
	var file = "res://audio/Sighs/" + sigh_fx.pick_random()
	print(file)
	stream.stream = load(file)
	stream.volume_db = +3
	stream.play()
	stream.name += str(random_id)
	stream.add_to_group("Sigh")
	await stream.finished
	remove_child(stream)

func _play_growls() -> void:
	var random_id = randi_range(1,1000000)
	var stream = AudioStreamPlayer.new()
	add_child(stream)
	var file = ar._choose_growl()
	print(file)
	stream.stream = load(file)
	stream.volume_db = -5
	stream.play()
	stream.name += str(random_id)
	stream.add_to_group("Growls")
	stream.add_to_group("SFX")
	await stream.finished
	remove_child(stream)

func _play_cut_music_snippets(string) -> void:
	var random_id = randi_range(1,1000000)
	var stream = AudioStreamPlayer.new()
	add_child(stream)
	var file = "res://music/Snippets/" + string
	print(file)
	stream.stream = load(file)
	stream.volume_db = -5
	stream.play()
	stream.name += str(random_id)
	stream.add_to_group("Music")
	await stream.finished
	remove_child(stream)

func _pause_audio_streams() -> void:
	for child in get_children():
		if not child.is_in_group("Randomizer"):
			child.set_stream_paused(true)

func _unpause_audio_streams() -> void:
	for child in get_children():
		if not child.is_in_group("Randomizer"):
			child.set_stream_paused(false)

func _kill_streams_by_group(group) -> void:
	get_tree().call_group(group, "queue_free")

func _fail(string) -> void:
	if gb.death:
		for child in get_children():
			if not child.is_in_group("Ambience") and not child.is_in_group("Randomizer"):
				child.queue_free()
		amb1.volume_db = -80
		amb2.volume_db = -80
		amb3.volume_db = -80
		_play_jumpscare("js2.ogg")
		_play_stingers("stinger4.ogg")
		_play_bassy("bass2.ogg")
		monster_active = false
	
func _time_fail() -> void:
	pass
	
	
