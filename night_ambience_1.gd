extends AkEvent3D

func _ready() -> void:
	add_to_group("AkAmbienceEvent")
	add_to_group("AkEvent")

func end() -> void:
	event.stop(self)
