extends Node

var menu_active: bool

func _ready() -> void:
	var mainscene = preload("res://mainscene.tscn").instantiate()
	add_child(mainscene)
	var menu = preload("res://main_menu.tscn").instantiate()
	add_child(menu)
	menu_active = true

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("right_click"):
		if menu_active == true:
			get_node("main_menu").queue_free()
			menu_active = false
			var event_controller = preload("res://event_controller.tscn").instantiate()
			add_child(event_controller)
