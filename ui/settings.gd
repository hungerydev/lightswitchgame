extends BoxContainer

@onready var res_opt_but: OptionButton = $BoxContainer/resolutionOption

var resolutions: Dictionary = {"3840x2160":Vector2i(3840,2160),
								"2560x1440":Vector2i(2560,1080),
								"1920x1080":Vector2i(1920,1080),
								"1366x768":Vector2i(1366,768),
								"1536x864":Vector2i(1536,864),
								"1280x720":Vector2i(1280,720),
								"1440x900":Vector2i(1440,900),
								"1600x900":Vector2i(1600,900),
								"1024x600":Vector2i(1024,600),
								"800x600": Vector2i(800,600)}

func _ready() -> void:
	_add_resolutions()

func _add_resolutions() -> void:
	for r in resolutions:
		res_opt_but.add_item(r)


func _on_resolution_option_item_selected(index: int) -> void:
	var id = res_opt_but.get_item_text(index)
	get_window().set_size(resolutions[id])
	_centre_window()

func _centre_window() -> void:
	var centre_screen = DisplayServer.screen_get_position()+DisplayServer.screen_get_size()/2
	var Window_Size = get_window().get_size_with_decorations()
	get_window().set_position(centre_screen-Window_Size/2)
