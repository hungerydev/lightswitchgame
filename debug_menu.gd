extends Control

var event_indeces: Array = []

func _ready() -> void:
	var container = BoxContainer.new()
	container.set_anchors_preset(Control.PRESET_TOP_LEFT)
	add_child(container)
	for hour in gb.event_dict:
		var hour_section = MenuButton.new()
		hour_section.text = hour
		for event in gb.event_dict[hour]:
			hour_section.get_popup().add_item(event)
			print(event)
		hour_section.process_mode = Node.PROCESS_MODE_WHEN_PAUSED
		container.add_child(hour_section)
		hour_section.get_popup().id_pressed.connect(_enable_event_override.bind(hour_section, hour))
	var cancel_override = Button.new()
	cancel_override.text = "Disable Override"
	cancel_override.pressed.connect(_disable_override)
	container.add_child(cancel_override)
	var manual_event = Button.new()
	manual_event.text = "Start next event manually"
	manual_event.pressed.connect(_start_event)
	container.add_child(manual_event)

func _enable_event_override(index, hour_section, hour) -> void:
	var new_event = hour_section.get_popup().get_item_text(index)
	sb._event_override.emit(hour_section, new_event, hour)

func _disable_override() -> void:
	if gb.override_event_target != null:
		gb.override_event_target = null

func _start_event() -> void:
	sb._manual_event_start.emit()
