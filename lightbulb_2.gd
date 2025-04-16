extends OmniLight3D

@onready var light = get_parent().get_child(0)

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_INHERIT

func _process(delta: float) -> void:
	visible = light.visible
	light_color = light.light_color
	
