extends Control

func _ready() -> void:
	$CenterContainer/start.pressed.connect(_start_custom_mode)
	$CenterContainer2/back.pressed.connect(_back_to_main_menu)
