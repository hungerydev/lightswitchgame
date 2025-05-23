extends Node

func _end_2_1() -> void:
	sb._event_start.emit(gb.end2.END_2_1)

func _end_2_2() -> void:
	sb._event_start.emit(gb.end2.END_2_2)

func _crash() -> void:
	get_tree().quit()
