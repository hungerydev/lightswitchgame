extends AkEvent3D

func _ready() -> void:
	add_to_group("AkTrainEndEvent")
	add_to_group("AkEvent")

func play() -> void:
	event.post(self)
	var tween = get_tree().create_tween()
	tween.tween_property(self, "global_position.z", 0, 12)
	
