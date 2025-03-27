extends Node3D

func _ready() -> void:
	SignalBus._event_1_1.connect(_event_1_1)
	
func _event_1_1() -> void:
	visible = true

func _reset() -> void:
	visible = false
