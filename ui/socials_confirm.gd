extends Control

func _ready() -> void:
	$CenterContainer/VBoxContainer/kofi.pressed.connect(_kofi)
	$CenterContainer/VBoxContainer/youtube.pressed.connect(_youtube)
	$CenterContainer/VBoxContainer/no.pressed.connect(_no)

func _kofi() -> void:
	OS.shell_open("https://ko-fi.com/tetramorre")
	
func _youtube() -> void:
	OS.shell_open("https://www.youtube.com/@Tetramorre")

func _no() -> void:
	get_parent()._ready()
