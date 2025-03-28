extends Node

@onready var parent: Entity = self.get_parent()

func _ready() -> void:
	add_to_group("Component")
	
func _set_position(location: Vector3, rotation: Vector3, scale: Vector3) -> void:
	parent.global_position = location
	parent.global_rotation = rotation
	parent.scale = scale
