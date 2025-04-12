extends Control

func _ready() -> void:
	_instantiate_main_page()
	$main_page/settings.pressed.connect(_instantiate_settings)
	$main_page/quit.pressed.connect(_quit_game)

func _instantiate_settings() -> void:
	for child in get_children():
		if child.name == "main_page":
			child.queue_free()
	var options = preload("uid://q28ueobsmonp").instantiate()
	add_child(options)

func _instantiate_main_page() -> void:
	for child in get_children():
		if child.name == "options_menu":
			child.queue_free()
	var main_page = preload("uid://gg5suj2tw5qv").instantiate()
	add_child(main_page)

func _quit_game():
	get_tree().quit()
