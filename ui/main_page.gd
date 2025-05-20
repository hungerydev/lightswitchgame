extends Control

@onready var current_hour: RichTextLabel = $BoxContainer/CurrentHour
@onready var chapter_select: OptionButton = $BoxContainer/ChapterSelect



func _ready() -> void:
	chapter_select.visible = false
	add_to_group("main_menu")
	_set_current_hour_text("")
	sb._hour_changed.connect(_set_current_hour_text)
	if gb.post_game_active:
		chapter_select.visible = true
		
func _set_current_hour_text(_event) -> void:
	match gb.current_hour:
		gb.tutorial:
			_new_text("")
		gb.hour1:
			_new_text("Current Chapter: Hour 1")
		gb.hour2:
			_new_text("Current Chapter: Hour 2")
		gb.hour3:
			_new_text("Current Chapter: Hour 3")
		gb.hour4:
			_new_text("Current Chaper: Hour 4")
		gb.hour5:
			_new_text("Current Chapter: Hour 5")
		gb.post_game:
			_new_text("Select a chapter above, or try out Custom Mode and Endless Mode")
		gb.custom_mode:
			_new_text("Current Chapter: Custom Mode")
		gb.endless_mode:
			_new_text("Current Chapter: Endless Mode")
	if gb.hour_5_active:
		_new_text("Current Chapter: Hour 5")
	if gb.custom_mode_active:
		_new_text("Current Chapter: Custom Mode")
	if gb.endless_mode_active:
		_new_text("Current Chapter: Endless Mode")

func _new_text(text) -> void:
	current_hour.text = text


func _on_chapter_select_item_selected(index: int) -> void:
	
	match index:
		1:
			
			gb.hour_5_active = false
			gb.custom_mode_active = false
			gb.endless_mode_active = false
			gb.current_hour = gb.hour1
		2:
			
			gb.hour_5_active = false
			gb.custom_mode_active = false
			gb.endless_mode_active = false
			gb.current_hour = gb.hour2
		3:
			
			gb.hour_5_active = false
			gb.custom_mode_active = false
			gb.endless_mode_active = false
			gb.current_hour = gb.hour3

		4:
			
			gb.hour_5_active = false
			gb.custom_mode_active = false
			gb.endless_mode_active = false
			gb.current_hour = gb.hour4

		5:
			
			gb.hour_5_active = true
			gb.custom_mode_active = false
			gb.endless_mode_active = false
			gb.current_hour = gb.hour5


func _on_submit_feedback_pressed() -> void:
	get_parent()._instantiate_feedback_response_menu()
