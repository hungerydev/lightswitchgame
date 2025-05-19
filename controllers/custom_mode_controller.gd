extends Node

func _ready() -> void:
	add_to_group("CMC")

func _start_custom_mode(hour_selection, difficulty, RNG):
	var max_selection: PackedInt32Array = [0,1,2,3]
	er._create_custom_dict(hour_selection)
	gb.custom_mode_difficulty = difficulty
	gf.chance_setting = RNG
	gb.current_hour = gb.custom_mode
	gb.custom_mode_active = true
	gb.hour_5_active = false
	gb.endless_mode_active = false
	if RNG == 0.1 and difficulty == 0.5:
		if hour_selection == max_selection:
			gb.max_custom_mode_active = true
			print(str(Time.get_ticks_msec()) + ": " + "Max difficulty baby!")
	get_tree().set_group("gc", "menu_active", true)
	get_tree().call_group("gc", "_start_game")
