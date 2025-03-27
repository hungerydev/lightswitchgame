extends Button

func _ready() -> void:
	self.pressed.connect(_on_lightswitch_pressed)
	
func _on_lightswitch_pressed() -> void:
	SignalBus._lightswitch_pressed.emit()
	
