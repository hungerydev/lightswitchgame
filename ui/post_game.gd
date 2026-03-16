extends Control

@onready var custom_mode: Button = $BoxContainer/custom_mode
@onready var endless_mode: Button = $BoxContainer/endless_mode
@onready var endings_text: RichTextLabel = $BoxContainer/Endings




func _ready() -> void:
	custom_mode.pressed.connect(_custom)
	endless_mode.pressed.connect(_endless)
	custom_mode.visible = false
	endless_mode.visible = false
	var endings: int = 0
	if gb.end_1_achieved == true:
		endings += 1
	if gb.end_2_achieved == true:
		endings += 1
	if gb.end_3_achieved == true:
		endings += 1
	match endings:
		0:
			endings_text.text = "Endings: 0/3"
		1:
			endings_text.text = "Endings: 1/3"
		2:
			endings_text.text = "Endings: 2/3"
		3:
			endings_text.text = "Endings: 3/3"
	if gb.post_game_active:
		custom_mode.visible = true
		endless_mode.visible = true

	
# TODO fix these
func _custom() -> void:
	get_parent()._instantiate_custom_mode_menu()

func _endless() -> void:
	get_parent()._instantiate_endless_mode_menu()
