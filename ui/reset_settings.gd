extends Button

@onready var settings: BoxContainer = $"../../settings"


var defaults: Dictionary =  {
		"fullscreen": Window.MODE_FULLSCREEN,
		"resolution": Vector2(1920, 1080),
		"vsync": DisplayServer.VSYNC_DISABLED,
		"scaler": Viewport.SCALING_3D_MODE_BILINEAR,
		"scaling_amount": 1.0,
		"screen": 1,
		"brightness_setting": 1.0
	}
	


func _on_pressed() -> void:
	slm._load_window_props(defaults)
	settings._check_variables()
	
