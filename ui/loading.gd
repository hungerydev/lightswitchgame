extends Control
class_name LoadingScreen

signal scene_loaded(path: String)

@onready var progress_bar = $ProgressBar

var textures: Array = ResourceLoader.list_directory("res://ui/loading_screen_textures/")

func _ready() -> void:
	add_to_group("Loading")
	var texture = load("res://ui/loading_screen_textures/" + textures.pick_random())
	progress_bar.texture_progress = texture

var path: String

var progress_value: float = 0.0

func load(path_to_load: String):
	path = path_to_load
	ResourceLoader.load_threaded_request(path)

func _process(delta: float) -> void:
	if not path: return

	var progress = []
	var status = ResourceLoader.load_threaded_get_status(path, progress)

	if status == ResourceLoader.ThreadLoadStatus.THREAD_LOAD_IN_PROGRESS:
		progress_value = progress[0] * 100
		progress_bar.value = move_toward(progress_bar.value, progress_value, delta * 60)

	if status == ResourceLoader.ThreadLoadStatus.THREAD_LOAD_LOADED:
		progress_bar.value = move_toward(progress_bar.value, 100.0, delta * 150)
	
		if progress_bar.value >= 99:
			scene_loaded.emit(path)
