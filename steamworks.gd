extends Node

enum achievements {
	SHADOW_CLICKS_1,
	SHADOW_CLICKS_100,
	SHADOW_CLICKS_1000,
	HOUR_1_COMPLETE,
	HOUR_2_COMPLETE,
	HOUR_3_COMPLETE,
	HOUR_4_COMPLETE,
	HOUR_5_COMPLETE,
	CUSTOM_MODE_COMPLETE,
	ENDLESS_MODE_COMPLETE,
	ENDLESS_MODE_EXHAUSTED,
	JUMPSCARED_1,
	JUMPSCARED_10,
	JUMPSCARED_100,
	EDITED_SAVE_FILE,
	TEST
}

func _init() -> void:
	pass
	
func _ready() -> void:
	OS.set_environment("SeamAppID", str(3681220))
	OS.set_environment("SteamGameID", str(3681220))
	_initialize_steam()

func _initialize_steam() -> void:
	var initialize_response: Dictionary = Steam.steamInitEx(3681220)
	print(str(Time.get_ticks_msec()) + ": " + "Did Steam Initialize?: %s " % initialize_response)
	print(str(Time.get_ticks_msec()) + ": " + Steam.getPersonaName())
	print(str(Time.get_ticks_msec()) + ": " + str(Steam.getAchievement("TEST")))
	if not Steam.setAchievement("SHADOW_CLICKS_1"):
		print(str(Time.get_ticks_msec()) + ": " + "Failed to set achievement: test")
		return
	Steam.storeStats()

func _process(delta: float) -> void:
	Steam.run_callbacks()

func _on_steam_stats_ready() -> void:
	print(str(Time.get_ticks_msec()) + ": " + str(Steam.getAchievement("SHADOW_CLICKS_1")))

func _achievement_unlock(enum_val: int) -> void:
	Steam.setAchievement(achievements.keys()[enum_val])
	print(str(Time.get_ticks_msec()) + ": " + "Attempting to unlock achievement:" + achievements.keys()[enum_val])
	Steam.storeStats()

func _increment_stats(string: String, value: int) -> void:
	match string:
		"monster_clicks":
			if Steam.getStatInt("SHADOW_CLICKS") > value:
				ap.monster_clicks = Steam.getStatInt("SHADOW_CLICKS") + 1
				value = ap.monster_clicks
			Steam.setStatInt("SHADOW_CLICKS", value)
		"jumpscares":
			if Steam.getStatInt("JUMPSCARES") > value:
				ap.jumpscares = Steam.getStatInt("JUMPSCARES") + 1
				value = ap.jumpscares
			Steam.setStatInt("JUMPSCARES", value)
	Steam.storeStats()
	print(str(Time.get_ticks_msec()) + ": " + "Current Steam Stats - Shadow Clicks = " + str(Steam.getStatInt("SHADOW_CLICKS")) + ", Jumpscares = " + str(Steam.getStatInt("JUMPSCARES")))
