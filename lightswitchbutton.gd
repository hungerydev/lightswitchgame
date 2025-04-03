extends Button

func _ready() -> void:
	self.pressed.connect(_on_lightswitch_pressed)
	
func _on_lightswitch_pressed() -> void:
	sb._lightswitch_pressed.emit()
	
