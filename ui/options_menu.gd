extends Control

func _ready() -> void:
	$BoxContainer/go_back.pressed.connect(_back_to_main_menu)

func _back_to_main_menu() -> void:
	get_parent()._ready()
	
