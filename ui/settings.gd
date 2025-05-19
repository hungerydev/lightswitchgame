extends BoxContainer

@onready var res_opt_but: OptionButton = $BoxContainer/resolutionOption
@onready var fullscreen_checkbox: CheckBox = $BoxContainer/Fullscreen_Checkbox
@onready var scale_label: Label = $BoxContainer/HBoxContainer/scaleLabel
@onready var fsr_options: OptionButton = $BoxContainer/FSROptions
@onready var scale_slider: HSlider = $BoxContainer/HBoxContainer/scaleSlider
@onready var vsync: CheckBox = $BoxContainer/vsync
@onready var screen_selector: OptionButton = $BoxContainer/screenSelector
@onready var scaler: OptionButton = $BoxContainer/scaler
@onready var brightness_silder: HSlider = $VBoxContainer/brightness_silder
@onready var version_info: Button = $version_info
@onready var emitters: CheckBox = $BoxContainer/emitters



var resolutions: Dictionary = {"3840x2160":Vector2i(3840,2160),
								"2560x1440":Vector2i(2560,1080),
								"1920x1080":Vector2i(1920,1080),
								"1366x768":Vector2i(1366,768),
								"1536x864":Vector2i(1536,864),
								"1280x720":Vector2i(1280,720),
								"1440x900":Vector2i(1440,900),
								"1600x900":Vector2i(1600,900),
								"1024x600":Vector2i(1024,600),
								"800x600": Vector2i(800,600)}

func _ready() -> void:
	_add_resolutions()
	_get_screens()
	_check_variables()
	version_info.text = "v" + str(ProjectSettings.get_setting("application/config/version"))


func _check_variables():
	var _window = get_window()
	var mode = _window.get_mode()
	
	if mode == Window.MODE_FULLSCREEN:
		fullscreen_checkbox.set_pressed_no_signal(true)
		res_opt_but.set_disabled(true)
		match get_viewport().get_scaling_3d_mode():
			0:
				scaler.select(1)
				_on_scaler_item_selected(1)
			2:
				scaler.select(2)
				_on_scaler_item_selected(2)
				var scale_value = get_viewport().get_scaling_3d_scale()
				match snappedf(scale_value, 0.01):
					0.50:
						fsr_options.select(1)
					0.59:
						fsr_options.select(2)
					0.67:
						fsr_options.select(3)
					0.77:
						fsr_options.select(4)
					
		if scaler.selected == 1:
			scale_slider.set_value(get_viewport().get_scaling_3d_scale() * 100.00)
		brightness_silder._ready()
		
	
	if DisplayServer.window_get_vsync_mode() == DisplayServer.VSYNC_ENABLED:
		vsync.set_pressed_no_signal(true)
	else:
		vsync.set_pressed_no_signal(false)
	for s in DisplayServer.get_screen_count():
		if s == get_window().get_current_screen():
			screen_selector.select(s)
	if gb.use_particles:
		emitters.set_pressed_no_signal(true)
	else:
		emitters.set_pressed_no_signal(false)

func _set_resolution_text() -> void:
	var res_text = str(get_window().get_size().x)+"x"+str(get_window().get_size().y)
	res_opt_but.set_text(res_text)
	scale_slider.set_value_no_signal(100.00)
	_on_scale_slider_value_changed(100.00)

func _add_resolutions() -> void:
	var current_resolution = get_window().get_size()
	var id = 0
	
	for r in resolutions:
		res_opt_but.add_item(r, id)
		if resolutions[r] == current_resolution:
			res_opt_but.select(id)
		id += 1


func _on_resolution_option_item_selected(index: int) -> void:
	var id = res_opt_but.get_item_text(index)
	get_window().set_size(resolutions[id])
	_set_resolution_text()
	_centre_window()

func _centre_window() -> void:
	var centre_screen = DisplayServer.screen_get_position()+DisplayServer.screen_get_size()/2
	var Window_Size = get_window().get_size_with_decorations()
	get_window().set_position(centre_screen-Window_Size/2)


func _on_fullscreen_checkbox_toggled(toggled_on: bool) -> void:
	res_opt_but.set_disabled(toggled_on)
	if toggled_on:
		get_window().set_mode(Window.MODE_FULLSCREEN)
		
	else:
		get_window().set_mode(Window.MODE_WINDOWED)
		_centre_window()
	
	get_tree().create_timer(0.05).timeout.connect(_set_resolution_text)


func _on_scale_slider_value_changed(value: float) -> void:
	var res_scale = value/100.0
	var res_text = str(snapped(get_window().get_size().x*res_scale,1))+" x "+str(snapped(get_window().get_size().y*res_scale,1))
	scale_label.set_text(str(value)+"% - " + res_text)
	get_viewport().set_scaling_3d_scale(res_scale)


func _on_scaler_item_selected(index: int) -> void:
	var viewport = get_viewport()
	match index:
		1:
			viewport.scaling_3d_mode = Viewport.SCALING_3D_MODE_BILINEAR
			scale_slider.set_editable(true)
			fsr_options.hide()
		2:
			viewport.scaling_3d_mode = Viewport.SCALING_3D_MODE_FSR2
			scale_slider.set_editable(false)
			fsr_options.show()


func _on_fsr_options_item_selected(index: int) -> void:
	match index:
		1:
			_on_scale_slider_value_changed(50.00)
		2:
			_on_scale_slider_value_changed(59.00)
		3:
			_on_scale_slider_value_changed(67.00)
		4:
			_on_scale_slider_value_changed(77.00)
		


func _on_vsync_toggled(toggled_on: bool) -> void:
	if toggled_on:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_ENABLED)
	else:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)

func _get_screens() -> void:
	var screens = DisplayServer.get_screen_count()
	for s in screens:
		screen_selector.add_item("Screen: " + str(s))
		

func _on_screen_selector_item_selected(index: int) -> void:
	var window = get_window()
	var mode = window.get_mode()
	window.set_mode(Window.MODE_WINDOWED)
	window.set_current_screen(index)
	
	if mode == Window.MODE_FULLSCREEN:
		window.set_mode(Window.MODE_FULLSCREEN)
		


func _on_version_info_pressed() -> void:
	var patch_notes = preload("uid://c5ie47b70a2gu").instantiate()
	get_parent().add_child(patch_notes)


func _on_emitters_toggled(toggled_on: bool) -> void:
	if toggled_on:
		get_tree().call_group("Emitter Controller", "_add_emitter")
		gb.use_particles = true
	if not toggled_on:
		get_tree().call_group("Particle Emitter", "queue_free")
		gb.use_particles = false
