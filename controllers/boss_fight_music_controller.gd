extends Node
class_name BossFightMusicController

func _ready() -> void:
	add_to_group("BFMC")
	sb._event_start.connect(_dip)
	sb._lightning_strike.connect(_boost)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("right_click"):
		match am.boss_fight_boosted:
			true:
				_dip("")
			false:
				_boost()

func _dip(_event) -> void:
	am._boss_fight_music_dip()

func _boost() -> void:
	am._boss_fight_music_boost()
