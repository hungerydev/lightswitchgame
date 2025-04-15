extends Control

func _ready() -> void:
	$CenterContainer/VBoxContainer/start.pressed.connect(_start_endless_mode)
	$CenterContainer/VBoxContainer/back.pressed.connect(_back_to_main_menu)

func _start_endless_mode() -> void:
	gb.current_hour = gb.endless_mode
	get_tree().call_group("gc", "_start_game")

func _back_to_main_menu() -> void:
	get_parent()._ready()
