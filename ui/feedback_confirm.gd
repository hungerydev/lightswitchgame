extends Control

func _ready() -> void:
	$CenterContainer/VBoxContainer/yes.pressed.connect(_yes)
	$CenterContainer/VBoxContainer/no.pressed.connect(_no)

func _yes() -> void:
	OS.shell_open("https://docs.google.com/forms/d/e/1FAIpQLScWh-QPooMvL6xnZi1R8viSMkPYJLcgiWcdure8PCS4NOK2Vg/viewform?usp=dialog")
	get_parent()._ready()
	
func _no() -> void:
	get_parent()._ready()
