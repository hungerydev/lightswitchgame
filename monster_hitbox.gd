extends Area3D

var mouse_active = false

@onready var pcom = $positionComponent

func _ready() -> void:
	SignalBus._event_1_1.connect(_event_1_1)
	SignalBus._event_finished.connect(_reset)

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

func _event_1_1() -> void:
	pass

func _reset() -> void:
	pass
