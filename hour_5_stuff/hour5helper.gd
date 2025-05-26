extends Node
class_name Hour5Helper

@onready var audio_stream_player: AudioStreamPlayer = $"../AudioStreamPlayer"

func _ready() -> void:
	sb._light_on.connect(volume_up)
	sb._light_off.connect(volume_down)

## Break the hour5loop at the correct time and remove the event controller
func stop_loop() -> void:
	sb._hour5_loop_deactivate.emit()
	

## Sunrise
func step_one() -> void:
	if gb.hour_5_active:
		await get_tree().create_timer(2, false).timeout
		print("Step one")
		sb._event_start.emit(gb.end1.END_1_1)
	else:
		print("Step one")
		sb._event_start.emit(gb.end1.END_1_1)
		
## Kid pulling lightswitch
func step_two() -> void:
	print("Step two")
	sb._event_start.emit(gb.end1.END_1_2)
	

## Darkness
func step_three() -> void:
	print("Step three")
	sb._event_start.emit(gb.end1.END_1_3)

## Dad pulling lightswitch
func step_four() -> void:
	print("Step four")
	sb._event_start.emit(gb.end1.END_1_4)

## Darkness
func step_five() -> void:
	print("Step five")
	sb._event_start.emit(gb.end1.END_1_5)

## Viewing from outside the window
func step_six() -> void:
	print("Step six")
	sb._event_start.emit(gb.end1.END_1_6)

## Wife walks up, consoles
func step_seven() -> void:
	print("Step seven")
	sb._event_start.emit(gb.end1.END_1_7)

## Wife moves to grab lightswitch
func step_eight() -> void:
	print("Step eight")
	sb._event_start.emit(gb.end1.END_1_8)

## Darkness
func step_nine() -> void:
	print("Step nine")
	sb._event_start.emit(gb.end1.END_1_9)
	var credits: Control = preload("uid://cux5p13g4uhf7").instantiate()
	get_parent().add_sibling(credits)
	get_parent().queue_free()
	
func volume_up() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property(audio_stream_player, "volume_db", -12, 0.1)
	
func volume_down() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property(audio_stream_player, "volume_db", -14, 0.1)
