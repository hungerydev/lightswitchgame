extends OmniLight3D

func _ready() -> void:
	sb._jumpscare_finished.connect(_off)

func _off(string) -> void:
	visible = false
