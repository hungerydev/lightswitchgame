extends Control

var event_indeces: Array = []

func _ready() -> void:
	var colo_rect = ColorRect.new()
	colo_rect.color = Color.BLACK
	colo_rect.PRESET_FULL_RECT
	colo_rect.size = Vector2(10000, 10000)
	colo_rect.color.a = 1
	add_child(colo_rect)
	
	var container = BoxContainer.new()
	container.set_anchors_preset(Control.PRESET_TOP_LEFT)
	container.vertical = true
	add_child(container)
	
	for hour in gb.event_dict:
		var hour_section = MenuButton.new()
		hour_section.text = hour
		for event in gb.event_dict[hour]:
			hour_section.get_popup().add_item(event)
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
	
	var perf_chance = Button.new()
	perf_chance.text = "Enable 100% chance on all RNG"
	perf_chance.pressed.connect(_enable_perf_chance)
	container.add_child(perf_chance)
	
	var perf_chance_dis = Button.new()
	perf_chance_dis.text = "Disable 100% chance on all RNG"
	perf_chance_dis.pressed.connect(_disable_perf_chance)
	container.add_child(perf_chance_dis)
	
	var enable_visual_effect = MenuButton.new()
	enable_visual_effect.text = "Enable/Disable Visual Effects"
	for child in gb.vis_effects:
		enable_visual_effect.get_popup().add_item(child.name)
	enable_visual_effect.get_popup().id_pressed.connect(_enable_visual_effect.bind(enable_visual_effect))
	container.add_child(enable_visual_effect)
	
	var hour_start = MenuButton.new()
	hour_start.text = "Start game at specific hour"
	for key in gb.event_dict:
		hour_start.get_popup().add_item(key)
	hour_start.get_popup().id_pressed.connect(_hour_start.bind(hour_start))
	container.add_child(hour_start)
	
	var disable_death = Button.new()
	disable_death.text = "Disable death timers and jumpscares"
	disable_death.pressed.connect(_disable_death)
	container.add_child(disable_death)
	
	var enable_death = Button.new()
	enable_death.text = "Enable death timers and jumpscares"
	enable_death.pressed.connect(_enable_death)
	container.add_child(enable_death)

func _enable_event_override(index, hour_section, hour) -> void:
	var new_event = hour_section.get_popup().get_item_text(index)
	sb._event_override.emit(hour_section, new_event, hour)

func _disable_override() -> void:
	if gb.override_event_target != null:
		gb.override_event_target = null

func _start_event() -> void:
	sb._manual_event_start.emit()
	
func _enable_perf_chance() -> void:
	gf.perf_chance = true

func _disable_perf_chance() -> void:
	gf.perf_chance = false
	
func _enable_visual_effect(id, _node) -> void:
	gb.vis_effects.get(id).visible = not gb.vis_effects.get(id).visible

func _hour_start(id, hour_start) -> void:
	var new_hour = hour_start.get_popup().get_item_text(id)
	gb.current_hour = gb.event_dict[new_hour]

func _disable_death() -> void:
	gb.death = false

func _enable_death() -> void:
	gb.death = true
