extends Control

func _ready() -> void:
	$BoxContainer/go_back.pressed.connect(_back_to_main_menu)
	$BoxContainer2/delete_save.pressed.connect(_delete_save)
	
func _back_to_main_menu() -> void:
	get_parent()._ready()
	
func _delete_save() -> void:
	var sure = preload("uid://caekpt3ac7vsy").instantiate()
	add_child(sure)
	
