extends Node

@onready var parent: Node = self.get_parent()

func _ready() -> void:
	add_to_group("Component")

func _set_visibility_on() -> void:
	parent.visible = true

func _set_visibility_off() -> void:
	parent.visible = false
