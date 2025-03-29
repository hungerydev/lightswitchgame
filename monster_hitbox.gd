extends Area3D

var mouse_active = false

@export var restpos = [Vector3(0.608086, 0.251468, 2.9471),Vector3(0.0363553, -1.78035, 1.45254),Vector3(1, 1.98868, 1.54615)]


@onready var pcom = $positionComponent

@onready var cshape = $CollisionShape3D

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
	pcom._set_position(Vector3(-3.03967, -0.380207, 1.81116),Vector3(0, 0, 0),Vector3(0.72, 2.259, 0.846))
	
func _reset() -> void:
	pcom._set_position(Vector3(0.608086, 0.251468, 2.9471),Vector3(0.0363553, -1.78035, 1.45254),Vector3(1, 1.98868, 1.54615))
