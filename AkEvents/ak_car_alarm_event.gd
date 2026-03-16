extends AkEvent3D

func _ready() -> void:
	add_to_group("AkCarAlarmEvent")
	add_to_group("AkSFX")
	add_to_group("AkEvents")

func play() -> void:
	event.post(self)

func end() -> void:
	event.stop(self)
