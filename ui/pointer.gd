extends Control


@onready var p1: CompressedTexture2D = preload("uid://gwe151i2i7wk")
@onready var p2: CompressedTexture2D = preload("uid://c5vcyno6pqwus")
@onready var p3: CompressedTexture2D = preload("uid://cbxpdgtb3eh1f")
@onready var p4: CompressedTexture2D = preload("uid://bsbea04fhjktt")

var loop: bool = true

func _ready() -> void:
	_cursor_loop()


func _cursor_loop() -> void:
	if loop:
		Input.set_custom_mouse_cursor(p1)
		await get_tree().create_timer(.16).timeout
		Input.set_custom_mouse_cursor(p2)
		await get_tree().create_timer(.16).timeout
		Input.set_custom_mouse_cursor(p3)
		await get_tree().create_timer(.16).timeout
		Input.set_custom_mouse_cursor(p4)
		await get_tree().create_timer(.16).timeout
	_cursor_loop()
