extends Area3D

var mouse_active = false

func _on_mouse_entered() -> void:
	print("Mouse entered")
	mouse_active = true
	
func _on_mouse_exited() -> void:
	print("Mouse exited")
	mouse_active = false
	

func _on_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if event.is_action_pressed("left_click"):
		print("you clicked on the monster")
		SignalBus._monster_clicked.emit()
