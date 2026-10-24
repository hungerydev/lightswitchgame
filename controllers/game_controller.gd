extends Node
class_name GameController

signal finished

var menu_active: bool:
	get:
		return menu_active
	set(value):
		menu_active = value

var control: bool = false

var override_active: bool = false

var main_scene: PackedScene

func _ready() -> void:
	if OS.has_feature("demo_mode"):
		gb.demo_mode = true
	add_to_group("gc")
	control = false
	_instantiate_pointer()
	await _initial_main_scene_load()
	await _instantiate_main_menu()
	_instantiate_persistent_audio()
	sb._event_finished.emit()
	sb._event_override.connect(_override)
	sb._manual_event_start.connect(_leave_debug_menu)
	sb._death_seq_finished.connect(_fail)
	get_tree().call_group("Loading", "queue_free")
	control = true


func _input(event: InputEvent) -> void:
	if control:
		if event.is_action_pressed("right_click"):
			_start_game()
		if event.is_action_pressed("debug_menu"):
			if get_tree().paused:
				_leave_debug_menu()
			else:
				_instantiate_debug_menu()
		if event.is_action_pressed("pause"):
			_pause_menu()

func _start_game() -> void:
	if menu_active:
		var tree: SceneTree = get_tree()
		tree.call_group("main_menu", "queue_free")
		tree.call_group("PostGameMenu", "queue_free")
		menu_active = false
		var monster = preload("res://monster_stuff/monsterthingfullinherit.tscn").instantiate()
		tree.get_first_node_in_group("Main Scene").add_child(monster)
		sb._hour_changed.emit(gb.current_hour)
		var event_controller = preload("uid://dvku403rcrta0").instantiate()
		add_child(event_controller)

func _fail() -> void: 
	control = false
	gf.chance_modifier = gf.chance_setting
	gb.difficulty = gb.difficulty_setting
	await _clear_scene()
	await _instantiate_main_scene()
	await _instantiate_main_menu()
	sb._event_finished.emit()
	pm._reset_progress()
	am._start_ambience()
	#am._kill_streams_by_group("BossFight")
	if gb.custom_endless_5_reset != {}:
		gb.current_hour = gb.custom_endless_5_reset
	am.monster_active = false
	control = true
	

func _clear_scene() -> Signal:
	for child in get_children():
		if !child.is_in_group("Pointer") and !child.is_in_group("PersistentAudio"):
			child.queue_free()
	get_tree().call_group("AkBossMusicEvent", "end")
	get_tree().call_group("BossFight", "queue_free")
	await get_tree().create_timer(0.01).timeout
	return finished


func _instantiate_persistent_audio() -> void:
	var pa = preload("uid://cwrhr4g7bf7w7").instantiate()
	add_child(pa)


func _instantiate_pointer() -> void:
	print("Creating pointer")
	var pointer = preload("uid://dciu331xf3kvc").instantiate()
	pointer.add_to_group("Pointer")
	add_child(pointer)

func _instantiate_main_scene() -> Signal:
	var scene_inst = main_scene.instantiate()
	scene_inst.add_to_group("Main Scene")
	add_child(scene_inst)
	get_tree().call_group("Controls", "_disable_controls")
	await get_tree().create_timer(.1).timeout
	return finished
	
func _instantiate_main_menu() -> Signal:
	print("Instantiating main menu")
	var menu = preload("uid://dx7ifjjpdwquv").instantiate()
	add_child(menu)
	await menu.finished
	menu_active = true
	print("Main menu instantiated")
	return finished

func _initial_main_scene_load() -> void:
	print("Initializing main scene")
	var loading: LoadingScreen = preload("uid://dwd7yehtak1ha").instantiate()
	add_child(loading)
	print("Loading loading screen scene")
	loading.load("uid://c2os4xibt88g5")
	await loading.scene_loaded
	print("Loading main scene")
	main_scene = ResourceLoader.load_threaded_get("uid://c2os4xibt88g5")
	var scene_inst = main_scene.instantiate()
	scene_inst.add_to_group("Main Scene")
	add_child(scene_inst)


func _instantiate_debug_menu() -> void:
	if Steam.getPersonaName() == "tetramorre":
		print("Welcome home tetra")
		get_tree().paused = true
		var debug_menu = preload("uid://bc2e27n8iojo6").instantiate()
		add_child(debug_menu)
	else:
		print("I can't let you do that")

func _leave_debug_menu() -> void:
	$"debug_menu".queue_free()
	get_tree().paused = false

func _pause_menu() -> void:
	if not menu_active:
		if get_tree().paused:
			$"pause_menu".queue_free()
			am._unpause_audio_streams()
			get_tree().paused = false
			print(str(Time.get_ticks_msec()) + ": " + "Game is unpaused")
		else:
			get_tree().paused = true
			print(str(Time.get_ticks_msec()) + ": " + "Game is paused")
			var pm: PauseMenu = preload("res://ui/pause_menu.tscn").instantiate()
			add_child(pm)

func _override(hour_section, event, hour) -> void:
	if override_active:
		override_active = false
		gb.override_event_target = null
	if not override_active:
		override_active = true
		gb._new_override_target(hour_section, event, hour)

func _enable_controls() -> void:
	control = true

func _disable_controls() -> void:
	control = false

func _quit_game() -> void:
	get_tree().call_group("Controls", "_disable_controls")
	_disable_controls()
	get_tree().quit()
