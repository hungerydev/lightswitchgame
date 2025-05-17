extends Node

func _ready() -> void:
	add_to_group("CMC")

func _start_custom_mode(hour_selection, difficulty, RNG):
	er._create_custom_dict(hour_selection)
	gb.custom_mode_difficulty = difficulty
	gf.chance_setting = RNG
	gb.current_hour = gb.custom_mode
	get_tree().set_group("gc", "menu_active", true)
	get_tree().call_group("gc", "_start_game")
