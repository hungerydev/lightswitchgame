extends AkEvent3D

func _ready() -> void:
	add_to_group("AkCreditsMusicEvent")
	add_to_group("AkEvent")

func play() -> void:
	event.post(self)

func end() -> void:
	event.stop(self)
