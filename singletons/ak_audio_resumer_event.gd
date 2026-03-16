extends AkEvent3D

func _ready() -> void:
	add_to_group("AkAudioResumerEvent")

func play() -> void:
	event.post(self)
