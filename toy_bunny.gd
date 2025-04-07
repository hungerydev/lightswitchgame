extends Entity

@onready var light = $SpotLight3D

func _ready() -> void:
	sb._event_start.connect(_event_start)
	sb._event_finished.connect(_reset)
	_reset()
	

func _event_start(event) -> void:
	await sb._light_off
	match event:
		gb.events.EVENT_1_4:
			if gf._rc_medium():
				sb._rc_result.emit(true)
				pcom._set_position(Vector3(1.86621, 1.31729, -5.93348),Vector3(0, -1.5342, 0),Vector3(3.45666, 3.45666, 3.45666))
				await sb._light_on
				light.visible = true
				am._play_stingers()
			else:
				sb._rc_result.emit(false)
			

func _reset() -> void:
	pcom._set_position(Vector3(0.355602, 0.69315, 4.76788),Vector3(0, -2.42655, 0),Vector3(3.45666, 3.45666, 3.45666))
	visible = true
	light.visible = false
