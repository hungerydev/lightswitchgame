extends Control

@onready var endings_text: RichTextLabel = $BoxContainer/Endings




func _ready() -> void:
	$BoxContainer/custom_mode.pressed.connect(_custom)
	$BoxContainer/endless_mode.pressed.connect(_endless)
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

	

func _custom() -> void:
	get_parent()._instantiate_custom_mode_menu()

func _endless() -> void:
	get_parent()._instantiate_endless_mode_menu()
