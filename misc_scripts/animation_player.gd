extends AnimationPlayer

func _ready() -> void:
	animation_finished.connect(_anim_done)

func _anim_done(anim) -> void:
	if anim == "jumpscare":
		sb._jumpscare_finished.emit()
