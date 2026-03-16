extends AkEvent3D

func _ready() -> void:
	add_to_group("AkAudioPauserEvent")

func play() -> void:
	event.post(self)
