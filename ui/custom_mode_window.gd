extends Control

@onready var mechanic_chooser: ItemList = $VBoxContainer/mechanic_chooser
@onready var start_button: Button = $CenterContainer/start
@onready var warning_text: RichTextLabel = $CenterContainer/SelectGameMode

func _ready() -> void:
	$CenterContainer/start.pressed.connect(_start_custom_mode)
	$CenterContainer2/back.pressed.connect(_back_to_main_menu)
	


func _start_custom_mode() -> void:
	var hour_selection = mechanic_chooser.get_selected_items()
	if hour_selection.is_empty():
		warning_text.visible = true
	else:
		var difficulty = abs($VBoxContainer/VBoxContainer2/difficulty_slider.value)
		var rng = abs($VBoxContainer/VBoxContainer3/rng_slider.value)
		var nodes = get_tree().get_nodes_in_group("CMC")
		for node in nodes:
			node._start_custom_mode(hour_selection, difficulty, rng)
	

func _back_to_main_menu() -> void:
	get_parent()._ready()
	
	
