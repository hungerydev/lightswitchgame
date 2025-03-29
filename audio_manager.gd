extends Node

func _ready() -> void:
	_play_sound("uid://cbtixxx1rr7do")

func _play_sound(sound: String) -> void:
	var stream = AudioStreamPlayer.new()
	add_child(stream)
	stream.stream = load(sound)
	stream.play()
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("DEBUG_play_footsteps"):
		_play_sound("uid://mcoulh5ae16j")
