extends SpotLight3D

var on: bool = false

@onready var cam = $"../Camera3D"

var control: bool = false

var flicker: bool = false

func _ready() -> void:
	add_to_group("Controls")
	on = visible
	set_process_input(false)
	sb._event_start.connect(_event_start)
	sb._event_finished.connect(_reset)
	sb._hour_changed.connect(_hour_changed)
	sb._time_fail.connect(_time_fail)
	sb._jumpscare_finished.connect(_lights_off_death)
	_hour_changed(gb.current_hour)

func _disable_controls() -> void:
	control = false

func _enable_controls() -> void:
	match gb.current_hour:
		gb.tutorial:
			control = false
		gb.hour1:
			control = false
		gb.hour2:
			control = true
		gb.hour3:
			control = false
		gb.hour4:
			control = false

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
		gb.hour4:
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
	if flicker:
		light_energy = randf_range(0,1.5)

func _event_start(_event) -> void:
	match gb.current_hour:
		gb.tutorial:
			_lights_off()
		gb.hour1:
			_lights_off()
		gb.hour2:
			_lights_off()
		gb.hour3:
			_lights_off()
		gb.hour4:
			_lights_off()
		gb.end3:
			_lights_off()
		gb.demo_sizzle:
			_lights_off()

func _lights_on() -> void:
	if not am.monster_active:
		if not visible:
			am._play_flashlight_fx()
		visible = true
		on = true
		sb._light_on.emit()
	elif not gb.death:
		visible = true
		on = true
		sb._light_on.emit()
	else:
		sb._fail.emit("fast")
	
func _lights_off() -> void:
	if visible:
		am._play_flashlight_fx()
	visible = false
	on = false
	am._play_flashlight_fx()
	await get_tree().create_timer(0.25).timeout
	sb._light_off.emit()

func _reset() -> void:
	light_color = Color(0.454, 0.384, 0.149)
	
func _time_fail(string) -> void:
	if gb.death:
		if not on:
			await sb._light_on
			flicker = true
			sb._fail.emit("slow")
		else:
			_flicker()

func _lights_off_death(string) -> void:
	visible = false
	on = false

func _flicker() -> void:
	control = false
	flicker = true
	await get_tree().create_timer(.1).timeout
	sb._fail.emit("slow")
