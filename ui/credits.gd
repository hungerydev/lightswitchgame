extends Control

@onready var title: AnimatedSprite2D = $title
@onready var assets: BoxContainer = $assets
@onready var audio: BoxContainer = $audio
@onready var animator: AnimationPlayer = $CreditsAnimator

func _ready() -> void:
	add_to_group("Credits")
	process_mode = Node.PROCESS_MODE_PAUSABLE
	gb.current_hour = gb.post_game
	gb.last_hour_completed = gb.hour5
	sw._achievement_unlock(sw.achievements.HOUR_5_COMPLETE)
	sb._event_start.connect(queue_free)

func _step_one() -> void:
	title.play("default")
	title.visible = true
	sb._remote_light_on.emit()

func _step_two() -> void:
	title.play("a_game_by")
	title.visible = true

func _step_three() -> void:
	assets.visible = true

func _step_four() -> void:
	audio.visible = true

func _darkness() -> void:
	sb._remote_light_off.emit()
	title.visible = false
	assets.visible = false
	audio.visible = false

func _title_screen() -> void:
	get_tree().call_group("gc", "_fail")
