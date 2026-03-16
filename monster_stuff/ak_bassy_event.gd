extends AkEvent3D

func _ready() -> void:
	add_to_group("AkBassyEvent")
	add_to_group("AkEvent")
	add_to_group("AkSFX")

func play() -> void:
	event.post(self)
