extends Control

func _ready() -> void:
	$settings/go_back.pressed.connect(_back_to_main_menu)
	$BoxContainer2/delete_save.pressed.connect(_delete_save)
	
func _back_to_main_menu() -> void:
	sb._brightness_hover.emit(false)
	slm._save_game("")
	get_parent()._ready()
	
func _delete_save() -> void:
	var sure = preload("uid://caekpt3ac7vsy").instantiate()
	add_child(sure)
	


func _on_hard_button_pressed() -> void:
	pass # Replace with function body.


func _on_medium_button_pressed() -> void:
	pass # Replace with function body.


func _on_easy_button_pressed() -> void:
	pass # Replace with function body.
