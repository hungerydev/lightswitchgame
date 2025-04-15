extends Control

func _ready() -> void:
	$CenterContainer/start.pressed.connect(_start_custom_mode)
	$CenterContainer2/back.pressed.connect(_back_to_main_menu)

func _start_custom_mode() -> void:
	var hour_selection = $VBoxContainer/mechanic_chooser.get_selected_items()
	var difficulty = abs($VBoxContainer/VBoxContainer2/difficulty_slider.value)
	var rng = abs($VBoxContainer/VBoxContainer3/rng_slider.value)
	var nodes = get_tree().get_nodes_in_group("CMC")
	for node in nodes:
		node._start_custom_mode(hour_selection, difficulty, rng)
	

func _back_to_main_menu() -> void:
	get_parent()._ready()
