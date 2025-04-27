extends BoxContainer



@onready var setting: RichTextLabel = $VBoxContainer/videoResolution
@onready var resOp: OptionButton = $VBoxContainer/resolutionOption


func _ready() -> void:
	match DisplayServer.window_get_size():
		Vector2i(1280, 720):
			resOp.select(0)
		Vector2i(1920, 1080):
			resOp.select(1)
		Vector2i(2560, 1440):
			resOp.select(2)
		Vector2i(3840, 2160):
			resOp.select(3)


func _set_resolution() -> void:
	pass


func _on_left_pressed() -> void:
	pass


func _on_right_pressed() -> void:
	pass


func _on_resolution_option_item_selected(index: int) -> void:
	match index:
		0:
			DisplayServer.window_set_size(Vector2i(1280, 720))
		1:
			DisplayServer.window_set_size(Vector2i(1920, 1080))
		2:
			DisplayServer.window_set_size(Vector2i(2560, 1440))
		3:
			DisplayServer.window_set_size(Vector2i(3840, 2160))
