extends Control

@onready var title: AnimatedSprite2D = $title
@onready var assets: BoxContainer = $assets
@onready var audio: BoxContainer = $audio
@onready var animator: AnimationPlayer = $CreditsAnimator
@onready var ak_credits_music_event: AkEvent3D = get_tree().get_first_node_in_group("AkCreditsMusicEvent")
@onready var programs: BoxContainer = $programs

func _ready() -> void:
	add_to_group("Credits")
	title.visible = false
	assets.visible = false
	audio.visible = false
	programs.visible = false
	process_mode = Node.PROCESS_MODE_PAUSABLE
	gb.current_hour = gb.post_game
	gb.last_hour_completed = gb.hour5
	sw._achievement_unlock(sw.achievements.HOUR_5_COMPLETE)
	sb._event_start.connect(_stop_credits_music)
	ak_credits_music_event.event.post_callback(ak_credits_music_event,AkUtils.AK_MARKER, call_step)
	

func call_step(data: Dictionary) -> void:
	if data.has("strLabel"):
		call_deferred(data.strLabel)

func step_one() -> void:
	title.play("default")
	title.visible = true
	sb._remote_light_on.emit()

func step_two() -> void:
	title.play("a_game_by")
	title.visible = true

func step_three() -> void:
	assets.visible = true

func step_four() -> void:
	audio.visible = true

func step_five() -> void:
	programs.visible = true

func _darkness() -> void:
	sb._remote_light_off.emit()
	title.visible = false
	assets.visible = false
	audio.visible = false
	programs.visible = false

func _title_screen() -> void:
	get_tree().call_group("gc", "_fail")

func _stop_credits_music(_event) -> void:
	ak_credits_music_event.event.stop(ak_credits_music_event, 1)
	
