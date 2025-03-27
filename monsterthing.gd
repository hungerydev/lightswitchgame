extends Node3D

@onready var vcom = $visibilityComponent

func _ready() -> void:
	SignalBus._event_1_1.connect(_event_1_1)
	SignalBus._event_finished.connect(_reset)
	
func _event_1_1() -> void:
	vcom._set_visibility_on()

func _reset() -> void:
	vcom._set_visibility_off()
