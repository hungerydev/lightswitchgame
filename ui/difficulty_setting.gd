extends BoxContainer

var easy_mode: String = "[wave]Easy[/wave]"
var easy_desc: String = "More forgiving timelimits\nLess punishing misclicks"
var medium_mode: String = "Normal"
var medium_desc: String = "The intended experience"
var hard_mode: String = "[shake]Hard[/shake]"
var hard_desc: String = "Less forgiving time limits\nMore punishing misclicks"

@onready var setting: RichTextLabel = $VBoxContainer/difficultySetting
@onready var desc: RichTextLabel = $VBoxContainer/difficultyDescription


func _ready() -> void:
	match gb.difficulty_setting:
		1.0:
			setting.text = medium_mode
			desc.text = medium_desc
		1.3:
			setting.text = easy_mode
			desc.text = easy_desc
		0.7:
			setting.text = hard_mode
			desc.text = hard_desc
		


func _set_difficulty() -> void:
	match setting.text:
		easy_mode:
			gb.difficulty_setting = 1.3
		medium_mode:
			gb.difficulty_setting = 1.0
		hard_mode:
			gb.difficulty_setting = 0.7


func _on_left_pressed() -> void:
	match setting.text:
		easy_mode:
			pass
		medium_mode:
			setting.text = easy_mode
			desc.text = easy_desc
		hard_mode:
			setting.text = medium_mode
			desc.text = medium_desc
	_set_difficulty()


func _on_right_pressed() -> void:
	match setting.text:
		easy_mode:
			setting.text = medium_mode
			desc.text = medium_desc
		medium_mode:
			setting.text = hard_mode
			desc.text = hard_desc
		hard_mode:
			pass
	_set_difficulty()
