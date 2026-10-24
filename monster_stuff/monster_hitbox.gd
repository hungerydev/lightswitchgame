extends Area3D

var mouse_active = false

var monster_active = false

var control: bool = true

var misclicks: int = 0:
	get:
		return misclicks
	set(value):
		misclicks = value
		if gb.difficulty > 1:
			misclick_limit = 4
		elif gb.difficulty > 0.7:
			misclick_limit = 3
		else:
			misclick_limit = 2
		if value == misclick_limit:
			sb._fail.emit("null")
var misclick_limit: int = 2

@export var restpos = [Vector3(0.608086, 0.251468, 2.9471),Vector3(0.0363553, -1.78035, 1.45254),Vector3(1, 1.98868, 1.54615)]

@onready var pcom = $positionComponent

@onready var cshape = $CollisionShape3D



func _ready() -> void:
	add_to_group("Controls")
	#sb._event_1_1.connect(_event_1_1)
	#sb._event_finished.connect(_reset)

func _on_mouse_entered() -> void:
	print(str(Time.get_ticks_msec()) + ": " + "Mouse entered")
	mouse_active = true
	
func _on_mouse_exited() -> void:
	print(str(Time.get_ticks_msec()) + ": " + "Mouse exited")
	mouse_active = false


func _input(event: InputEvent) -> void:
	if not control:
		pass
	elif monster_active:
		if event.is_action_pressed("left_click"):
			if mouse_active:
				print(str(Time.get_ticks_msec()) + ": " + "you clicked on the monster")
				sb._monster_clicked.emit()
			else:
				print(str(Time.get_ticks_msec()) + ": " + "You missed the monster!")
				if not gb.current_hour == gb.tutorial:
					misclicks += 1
			
func _disable_controls() -> void:
	control = false

func _enable_controls() -> void:
	control = true

#func _event_1_1() -> void:
	#pcom._set_position(Vector3(-3.03967, -0.380207, 1.81116),Vector3(0, 0, 0),Vector3(0.72, 2.259, 0.846))
	#
#func _reset() -> void:
	#pcom._set_position(Vector3(0.608086, 0.251468, 2.9471),Vector3(0.0363553, -1.78035, 1.45254),Vector3(1, 1.98868, 1.54615))
