extends Control
class_name MainMenu

signal finished

func _ready() -> void:
	add_to_group("main_menu")
	await _instantiate_main_page()
	$main_page/BoxContainer/settings.pressed.connect(_instantiate_settings)
	$main_page/BoxContainer/quit.pressed.connect(_quit_game)
	finished.emit()
	
	

func _instantiate_settings() -> void:
	get_tree().set_group("gc", "menu_active", false)
	sb._menu_light_off.emit()
	for child in get_children():
		if child.name == "main_page":
			child.queue_free()
		if child.name == "post_game":
			child.queue_free()
	var options = preload("uid://q28ueobsmonp").instantiate()
	add_child(options)
	options.visible = false
	await get_tree().create_timer(0.5).timeout
	sb._menu_light_on.emit()
	options.visible = true

func _instantiate_main_page() -> Signal:
	get_tree().set_group("gc", "menu_active", true)
	var pg = null
	sb._menu_light_off.emit()
	for child in get_children():
		if child.name != "main_page":
			child.queue_free()
	var main_page = preload("uid://gg5suj2tw5qv").instantiate()
	add_child(main_page)
	get_tree().call_group("Controls", "_disable_controls")
	main_page.visible = false
	if gb.post_game_active:
		pg = _instantiate_post_game()
		add_child(pg)
		pg.visible = false
	await get_tree().create_timer(0.5).timeout
	sb._menu_light_on.emit()
	main_page.visible = true
	if pg != null:
		pg.visible = true
	return finished

func _instantiate_post_game() -> Control:
	var pg = preload("uid://dah32f8hosg6b").instantiate()
	return pg
	

func _instantiate_custom_mode_menu() -> void:
	get_tree().set_group("gc", "menu_active", false)
	sb._menu_light_off.emit()
	for child in get_children():
		if child.name == "main_page":
			child.queue_free()
		if child.name == "post_game":
			child.queue_free()
	var custom_mode = preload("uid://cmw8m4q7o0frt").instantiate()
	add_child(custom_mode)
	var cmc = preload("uid://dh8v5pqicae2j").instantiate()
	add_child(cmc)
	custom_mode.visible = false
	await get_tree().create_timer(0.5).timeout
	sb._menu_light_on.emit()
	custom_mode.visible = true

func _instantiate_endless_mode_menu() -> void:
	get_tree().set_group("gc", "menu_active", false)
	sb._menu_light_off.emit()
	for child in get_children():
		if child.name == "main_page":
			child.queue_free()
		if child.name == "post_game":
			child.queue_free()
	var endless_mode = preload("uid://ddbt5gxjq5o8w").instantiate()
	add_child(endless_mode)
	endless_mode.visible = false
	await get_tree().create_timer(0.5).timeout
	sb._menu_light_on.emit()
	endless_mode.visible = true

func _instantiate_feedback_response_menu() -> void:
	get_tree().set_group("gc", "menu_active", false)
	sb._menu_light_off.emit()
	for child in get_children():
		if child.name == "main_page":
			child.queue_free()
		if child.name == "post_game":
			child.queue_free()
	var feedback_confirm = preload("uid://cuhw5dhbgg6eu").instantiate()
	add_child(feedback_confirm)
	feedback_confirm.visible = false
	await get_tree().create_timer(0.5).timeout
	sb._menu_light_on.emit()
	feedback_confirm.visible = true

func _quit_game():
	get_tree().call_group("Controls", "_disable_controls")
	get_tree().call_group("gc", "_disable_controls")
	for child in get_children():
		child.visible = false
	sb._menu_light_off.emit()
	await get_tree().create_timer(.5).timeout
	get_tree().quit()
