extends AkEvent3D

func _ready() -> void:
	add_to_group("AkStingerEvent")
	add_to_group("AkEvent")
	add_to_group("AkSFX")

func play() -> void:
	event.post(self)

func end() -> void:
	event.stop(self)
