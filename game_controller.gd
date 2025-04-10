extends Node

var menu_active: bool

var override_active: bool = false

func _ready() -> void:
	var mainscene = preload("res://mainscene.tscn").instantiate()
	mainscene.add_to_group("Main Scene")
	add_child(mainscene)
	var menu = preload("res://main_menu.tscn").instantiate()
	add_child(menu)
	menu_active = true
	sb._event_finished.emit()
	sb._event_override.connect(_override)
	sb._manual_event_start.connect(_leave_debug_menu)
	sb._fail.connect(_fail)


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("right_click"):
		if menu_active == true:
			get_node("main_menu").queue_free()
			menu_active = false
			var event_controller = preload("res://event_controller.tscn").instantiate()
			add_child(event_controller)
	if event.is_action_pressed("debug_menu"):
		if get_tree().paused:
			_leave_debug_menu()
		else:
			_instantiate_debug_menu()

func _fail() -> void:
	await sb._jumpscare_finished
	for child in get_children():
		if child.is_in_group("Main Scene"):
			child.queue_free()

func _instantiate_debug_menu() -> void:
	get_tree().paused = true
	var debug_menu = preload("res://debug_menu.tscn").instantiate()
	add_child(debug_menu)

func _leave_debug_menu() -> void:
	$"debug_menu".queue_free()
	get_tree().paused = false

func _override(hour_section, event, hour) -> void:
	if override_active:
		override_active = false
		gb.override_event_target = null
	if not override_active:
		override_active = true
		gb._new_override_target(hour_section, event, hour)
