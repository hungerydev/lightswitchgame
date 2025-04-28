extends Node

func _ready() -> void:
	sb._hour_changed.connect(_save_game)
	_load_game()
	_load_data()

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

func _load_data() -> void:
	if not FileAccess.file_exists("user://userdata.json"):
		return
	
	var err = FileAccess.open("user://userdata.json", FileAccess.READ)
	if err == null:
		print(FileAccess.get_open_error())
		_save_game("null")
	else:
		var _dict1 = err.get_var()
		var dict2 = err.get_var()
		gb._load_data(dict2)
		
			

func _save_game(_hour) -> void:
	var err = FileAccess.open("user://usersave.json", FileAccess.WRITE)
	if err == null:
		print(FileAccess.get_open_error())
	else:
		var data = gb._save()
		var json_string = JSON.stringify(data)
		err.store_line(json_string)
	_save_user_data()

func _save_user_data() -> void:
	var err = FileAccess.open("user://userdata.json", FileAccess.WRITE)
	if err == null:
		print(FileAccess.get_open_error())
	else:
		var data1 = gb._save()
		var data2 = gb._save_data()
		err.store_var(data1)
		err.store_var(data2)
		
func _delete_save() -> void:
	gb.current_hour = gb.tutorial
	gb.last_hour_completed = gb.tutorial
