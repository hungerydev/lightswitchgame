extends OmniLight3D

@onready var light = get_parent().get_child(0)

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_INHERIT
	sb._menu_light_off.connect(_lights_off)
	sb._menu_light_on.connect(_lights_on)
	sb._event_start.connect(_process_on)

func _process(delta: float) -> void:
	visible = light.visible
	light_color = light.light_color
	
func _process_on(_event) -> void:
	set_process(true)
	
func _lights_off() -> void:
	set_process(false)
	visible = false
	am._play_ls_off()
	
func _lights_on() -> void:
	set_process(false)
	visible = true
	am._play_ls_on()
