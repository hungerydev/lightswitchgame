extends Node
class_name ShadowCastComponent

@onready var parent = get_parent()

func _set_shadows_only() -> void:
	parent.cast_shadow = 3

func _set_draw_on() -> void:
	parent.cast_shadow = 1
