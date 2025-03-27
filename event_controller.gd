extends Node

func _ready() -> void:
	SignalBus._monster_clicked.connect(_monster_clicked)
	
	
func _monster_clicked() -> void:
	pass
