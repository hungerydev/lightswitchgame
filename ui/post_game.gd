extends Control





func _ready() -> void:
	$BoxContainer/custom_mode.pressed.connect(_custom)
	$BoxContainer/endless_mode.pressed.connect(_endless)

	

func _custom() -> void:
	get_parent()._instantiate_custom_mode_menu()

func _endless() -> void:
	get_parent()._instantiate_endless_mode_menu()
