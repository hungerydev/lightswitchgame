extends Control

func _ready() -> void:
	$CenterContainer/VBoxContainer/yes.pressed.connect(_delete_save)
	$CenterContainer/VBoxContainer/no.pressed.connect(_back)

func _delete_save() -> void:
	slm._delete_save()
	queue_free()
	
func _back() -> void:
	queue_free()
