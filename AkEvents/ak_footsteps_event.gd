extends AkEvent3D

@export var switch_fast: WwiseSwitch
@export var switch_medium: WwiseSwitch
@export var switch_slow: WwiseSwitch

var positions: Array = [Vector3(-2.41309, 2.9754, 3.54386),
						Vector3(0.382, 1.708677, 3.459),
						Vector3(2.74795, 1.708677, 5.51897),
						Vector3(2.60226, 1.708677, -0.249993),
						Vector3(0.218161, 2.708677, -0.249993),
						Vector3(-2.12018, 1.708677, -0.249993)]

func _ready() -> void:
	add_to_group("AkFootstepsEvent")
	add_to_group("AkEvent")
	add_to_group("AkSFX")
	self.end_of_event.connect(footsteps_finished)
	self.audio_marker.connect(_move_toward_center)

func _random_position() -> void:
	global_position = positions.pick_random()
	#var tween = get_tree().create_tween()
	#tween.tween_property(self, "global_position", Vector3())

func _move_toward_center(data) -> void:
	global_position.x = move_toward(global_position.x, -global_position.x, .2)
	global_position.z = move_toward(global_position.z, -global_position.z, .2)

func play():
	_random_position()
	post_event()

func footsteps_finished(data) -> void:
	call_deferred("sig")

func sig() -> void:
	sb._footsteps_finished.emit()

func end() -> void:
	event.stop(self)
