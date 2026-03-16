extends AkEvent3D

var positions_right: Array = [
	Vector3(-71.0979, 17.1899, -20),
	Vector3(-81.0852, 28.7501, -17.1872),
	Vector3(-51.7825, 28.7501, -15.88247),
	Vector3(-57.2229, 17.4368, -18.88247)
]
var positions_back: Array = [
	Vector3(-0.784519, 17.4368, -48.3718),
	Vector3(-0.784519, 35.3779, -65.0334),
	Vector3(9.95436, 35.3779, -65.0334),
	Vector3(-13.1103, 35.3779, -89.3689),
	Vector3(-13.1103, 35.3779, -49.9387)
]

func _ready() -> void:
	add_to_group("AkLightningEvent")

func play(pos) -> void:
	match pos:
		"back":
			global_position = positions_back.pick_random()
		"right":
			global_position = positions_right.pick_random()
	event.post(self)
