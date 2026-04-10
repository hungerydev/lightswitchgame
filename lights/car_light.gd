extends SpotLight3D

var chance_active: bool = false
@onready var car_light_player: AnimationPlayer = %car_light_player

func _ready() -> void:
	add_to_group("Entity")
	sb._event_start.connect(_chance)
	sb._fail.connect(_fail)

func _chance(_event) -> void:
	match gb.current_hour:
		_:
			if gf._rc_very_hard():
				chance_active = true

func _random_chance() -> void:
	await get_tree().create_timer(randf_range(.25, 1.24)).timeout
	am._play_car_alarm()
	car_light_player.play("carl_alarm")
	await sb._event_finished
	_disable()

func _disable() -> void:
	am._end_streams_by_group("AkCarAlarmEvent")
	car_light_player.play("RESET")
	chance_active = false

func _fail(string) -> void:
	am._end_streams_by_group("AkCarAlarmEvent")
	car_light_player.play("RESET")
	chance_active = false

