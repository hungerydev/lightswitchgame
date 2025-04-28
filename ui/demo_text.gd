extends RichTextLabel

func _ready() -> void:
	if gb.demo_mode:
		visible = true
