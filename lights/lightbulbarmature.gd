extends Node3D

@onready var light_bulb_animator: AnimationPlayer = $Skeleton3D/LightBulbAnimator
@onready var light_target: Node3D = $Skeleton3D/LightTarget


var chance_active: bool = false

func _ready() -> void:
	add_to_group("Entity")
	sb._event_start.connect(_chance)

func _process(delta: float) -> void:
	sb._light_target_pos.emit(light_target.global_position)

func _chance(_event) -> void:
	match gb.current_hour:
		gb.hour1, gb.hour4:
			if gf._rc_hard():
				chance_active = true

func _random_chance() -> void:
	light_bulb_animator.play("swing")
	await sb._event_finished
	light_bulb_animator.play("RESET")
