extends CSGBox3D

@onready var light_fov: Camera3D = $CSGBox3D/SubViewport/Camera3D
@onready var sl_in_room: SpotLight3D = $SpotLight3D

func _ready() -> void:
	light_fov.fov = 179
	sl_in_room.spot_range = 3
	sl_in_room.visible = false
	sb._event_start.connect(_event_start)
	sb._jumpscare_finished.connect(_lights_off_death)
	sb._remote_light_off.connect(_lights_off_death_2)

func _event_start(event) -> void:
	match gb.current_hour:
		gb.end3:
			match event:
				gb.end3.END_3_2:
					sl_in_room.visible = true
					var tween1 = get_tree().create_tween()
					tween1.tween_property(light_fov, "fov", 1, 15)
					await get_tree().create_timer(12, false).timeout
					var tween2 = get_tree().create_tween()
					tween2.tween_property(sl_in_room, "spot_range", 28, 3)

func _lights_off_death(_i) -> void:
	light_fov.fov = 179
	sl_in_room.visible = false

func _lights_off_death_2() -> void:
	light_fov.fov = 179
	sl_in_room.visible = false
