extends Node

func _ready() -> void:
	sb._hour_changed.connect(_save_game)
	_load_game()

func _load_game() -> void:
	if not FileAccess.file_exists("user://usersave.json"):
		return
	
	var err = FileAccess.open("user://usersave.json", FileAccess.READ)
	if err == null:
		print(FileAccess.get_open_error())
		_save_game("null")
	else:
		while err.get_position() < err.get_length():
			var json_string = err.get_line()
			var json = JSON.new()
			var parse_result = json.parse(json_string)
			if not parse_result == OK:
				print("JSON Parse Error: ", json.get_error_message(), " in ", json_string, " at line ", json.get_error_line())
				continue
			var data = json.data
			gb._load(data)
	_load_data()

func _load_data() -> void:
	if not FileAccess.file_exists("user://userdata.data"):
		return
	
	var err = FileAccess.open("user://userdata.data", FileAccess.READ)
	if err == null:
		print(FileAccess.get_open_error())
		_save_game("null")
	else:
		var _dict1 = err.get_var()
		var dict2 = err.get_var()
		var dict3 = err.get_var()
		gb._load_data(dict2)
		_load_window_props(dict3)
		
			

func _save_game(_hour) -> void:
	if not gb.loading:
		var err = FileAccess.open("user://usersave.json", FileAccess.WRITE)
		if err == null:
			print(FileAccess.get_open_error())
		else:
			var data = gb._save()
			var json_string = JSON.stringify(data)
			err.store_line(json_string)
		_save_user_data()

func _save_window_props() -> Dictionary:
	var _window = get_window()
	var mode = _window.get_mode()
	var vsync = DisplayServer.window_get_vsync_mode()
	var scaler = get_viewport().get_scaling_3d_mode()
	var scaling_amount = get_viewport().get_scaling_3d_scale()
	var screen = get_window().get_current_screen()
	var save_dict = {
		"fullscreen": mode,
		"resolution": _window.size,
		"vsync": vsync,
		"scaler": scaler,
		"scaling_amount": scaling_amount,
		"screen": screen,
		"brightness_setting": gb.brightness_setting
	}
	return save_dict

func _load_window_props(dict) -> void:
	get_window().size = dict["resolution"]
	get_window().set_mode(dict["fullscreen"])
	get_window().set_current_screen(dict["screen"])
	get_viewport().set_scaling_3d_mode(dict["scaler"])
	get_viewport().set_scaling_3d_scale(dict["scaling_amount"])
	DisplayServer.window_set_vsync_mode(dict["vsync"])
	gb.brightness_setting = dict["brightness_setting"]

func _save_user_data() -> void:
	var err = FileAccess.open("user://userdata.data", FileAccess.WRITE)
	if err == null:
		print(FileAccess.get_open_error())
	else:
		var data1 = gb._save()
		var data2 = gb._save_data()
		var data3 = _save_window_props()
		err.store_var(data1)
		err.store_var(data2)
		err.store_var(data3)
	err = FileAccess.open("user://userdata.data", FileAccess.READ)
	if err == null:
		print(FileAccess.get_open_error())
	print(err.get_var())
	print(err.get_var())
	print(err.get_var())
		
func _delete_save() -> void:
	gb.current_hour = gb.tutorial
	gb.last_hour_completed = gb.tutorial
