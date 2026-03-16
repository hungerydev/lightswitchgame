@tool

extends SubViewport

@export var take_screenshot: bool = false:
	set(value):
		_on_take_screenshot(value)

func _on_take_screenshot(_take_screenshot:bool) -> void:
#func _process(float) -> void:
#func _input(event: InputEvent) -> void:
	#if event.is_action_pressed("DEBUG_Screenshot"):
		var numb = randi_range(1,99999)
		print("Running Script")
		await RenderingServer.frame_post_draw
		var img = get_texture().get_image().save_png("res://screenshot" + str(numb) + ".png")
