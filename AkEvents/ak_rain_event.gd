extends AkEvent3D

func _ready() -> void:
	add_to_group("AkRainEvent")
	add_to_group("AkEvent")

func play() -> void:
	event.post(self)

func end() -> void:
	event.stop(self, 8, AkUtils.AK_CURVE_LINEAR)
