extends Node

func _ready() -> void:
	sb._hour_changed.connect(_save_game)
	_load_game()

func _load_game() -> void:
	if not FileAccess.file_exists("user://savedata.json"):
		return
	
	var err = FileAccess.open("user://savedata.json", FileAccess.READ)
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

func _save_game(_hour) -> void:
	var err = FileAccess.open("user://savedata.json", FileAccess.WRITE)
	if err == null:
		print(FileAccess.get_open_error())
	else:
		var data = gb._save()
		var json_string = JSON.stringify(data)
		err.store_line(json_string)

func _delete_save() -> void:
	gb.current_hour = gb.tutorial
