extends Control

func _ready() -> void:
	_instantiate_main_page()
	$main_page/settings.pressed.connect(_instantiate_settings)
	$main_page/quit.pressed.connect(_quit_game)
	if gb.current_hour == gb.post_game:
		_instantiate_post_game()

func _instantiate_settings() -> void:
	for child in get_children():
		if child.name == "main_page":
			child.queue_free()
	var options = preload("uid://q28ueobsmonp").instantiate()
	add_child(options)

func _instantiate_main_page() -> void:
	for child in get_children():
		if child.name != "main_page":
			child.queue_free()
	var main_page = preload("uid://gg5suj2tw5qv").instantiate()
	add_child(main_page)

func _instantiate_post_game() -> void:
	var pg = preload("uid://dah32f8hosg6b").instantiate()
	add_child(pg)
	

func _instantiate_custom_mode_menu() -> void:
	for child in get_children():
		if child.name == "main_page":
			child.queue_free()
		if child.name == "post_game":
			child.queue_free()
	var custom_mode = preload("uid://cmw8m4q7o0frt").instantiate()
	add_child(custom_mode)
	var cmc = preload("uid://dh8v5pqicae2j").instantiate()
	add_child(cmc)

func _instantiate_endless_mode_menu() -> void:
	for child in get_children():
		if child.name == "main_page":
			child.queue_free()
		if child.name == "post_game":
			child.queue_free()
	var endless_mode = preload("uid://ddbt5gxjq5o8w").instantiate()
	add_child(endless_mode)

func _quit_game():
	get_tree().quit()
