extends RichTextLabel

func _ready() -> void:
	if OS.has_feature("demo_build"):
		visible = true
