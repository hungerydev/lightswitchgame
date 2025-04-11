extends SpotLight3D

var on: bool = false

@onready var cam = $"../Camera3D"

var control: bool = false

func _ready() -> void:
	on = visible
	set_process_input(false)
	sb._event_start.connect(_event_start)
	sb._event_finished.connect(_reset)
	sb._remote_light_on.connect(_lights_on)
	sb._remote_light_off.connect(_lights_off)
	sb._hour_changed.connect(_hour_changed)



func _hour_changed(hour) -> void:
	match hour:
		gb.tutorial:
			control = false
		gb.hour1:
			control = false
		gb.hour2:
			control = true
		gb.hour3:
			control = false

func _process(_delta: float) -> void:
	var m_pos = get_viewport().get_mouse_position()
	var ray_start = cam.project_ray_origin(m_pos)
	var ray_end = ray_start + cam.project_ray_normal(m_pos) * 10
	look_at(ray_end)
	if control:
		if Input.is_action_just_pressed("right_click"):
			if on:
				_lights_off()
			else:
				_lights_on()

func _event_start(_event) -> void:
	match gb.current_hour:
		gb.tutorial:
			pass
		gb.hour1:
			pass
		gb.hour2:
			_lights_off()

func _lights_on() -> void:
	visible = true
	on = true
	sb._light_on.emit()
	
func _lights_off() -> void:
	visible = false
	on = false
	await get_tree().create_timer(0.25).timeout
	sb._light_off.emit()

func _reset() -> void:
	light_color = Color(0.454, 0.384, 0.149)
