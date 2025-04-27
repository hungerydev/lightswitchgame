extends Control
class_name PauseMenu

func _ready() -> void:
	am._pause_audio_streams()

func _on_resume_pressed() -> void:
	am._unpause_audio_streams()
	get_tree().call_group("gc", "_pause_menu")


func _on_main_menu_pressed() -> void:
	get_tree().call_group("gc", "_fail")


func _on_exit_game_pressed() -> void:
	get_tree().quit()
