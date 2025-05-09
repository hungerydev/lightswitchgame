extends Node

var monster_clicks: int = 0
var jumpscares: int = 0
var hour_progress: String

func _ready() -> void:
	sb._monster_clicked.connect(_monster_clicked)
	sb._hour_changed.connect(_hour_changed)
	sb._jumpscare_finished.connect(_jumpscare_finished)

func _monster_clicked() -> void:
	monster_clicks += 1
	sw._increment_stats("monster_clicks", monster_clicks)
	match monster_clicks:
		1:
			sw._achievement_unlock(sw.achievements.SHADOW_CLICKS_1)
		100:
			sw._achievement_unlock(sw.achievements.SHADOW_CLICKS_100)
		1000:
			sw._achievement_unlock(sw.achievements.SHADOW_CLICKS_1000)
			

func _hour_changed(hour) -> void:
	match gb.last_hour_completed:
		gb.hour1:
			sw._achievement_unlock(sw.achievements.HOUR_1_COMPLETE)
		gb.hour2:
			sw._achievement_unlock(sw.achievements.HOUR_2_COMPLETE)
		gb.hour3:
			sw._achievement_unlock(sw.achievements.HOUR_3_COMPLETE)
		gb.hour4:
			sw._achievement_unlock(sw.achievements.HOUR_4_COMPLETE)
		gb.hour5:
			sw._achievement_unlock(sw.achievements.HOUR_5_COMPLETE)

func _jumpscare_finished(_string) -> void:
	jumpscares += 1
	sw._increment_stats("jumpscares", jumpscares)
	match jumpscares:
		1:
			sw._achievement_unlock(sw.achievements.JUMPSCARED_1)
		10:
			sw._achievement_unlock(sw.achievements.JUMPSCARED_10)
		100:
			sw._achievement_unlock(sw.achievements.JUMPSCARED_100)

func _save() -> Dictionary:
	var save_dict = {
		"monster_clicks": monster_clicks,
		"jumpscares": jumpscares,
		"hour_progress": hour_progress
	}
	return save_dict

func _load(dict) -> void:
	if dict != null:
		monster_clicks = dict["monster_clicks"]
		jumpscares = dict["jumpscares"]
		hour_progress = dict["hour_progress"]
