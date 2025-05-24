extends Node3D

@onready var animator: AnimationPlayer = $SunAnimator

func _ready() -> void:
    visible = false
    sb._event_start.connect(_event_start)
    sb._remote_sun_off.connect(_off)
    sb._remote_sun_on.connect(_on)

func _event_start(event) -> void:
    match gb.current_hour:
        gb.end1:
            match event:
                gb.end1.END_1_1:
                    visible = true
                    animator.play("sunrise")
                gb.end1.END_1_9:
                    visible = false

func _off() -> void:
    visible = false

func _on() -> void:
    visible = true