extends AkEvent3D

@export var on:WwiseEvent
@export var off:WwiseEvent

func _ready() -> void:
	add_to_group("AkLightbulbEvent")

func light_on() -> void:
	on.post(self)

func light_off() -> void:
	off.post(self)
