extends Node

func _init() -> void:
	pass
	
func _ready() -> void:
	OS.set_environment("SeamAppID", str(3681220))
	OS.set_environment("SteamGameID", str(3681220))
	_initialize_steam()

func _initialize_steam() -> void:
	var initialize_response: Dictionary = Steam.steamInitEx(3681220)
	print("Did Steam Initialize?: %s " % initialize_response)
	print(Steam.getPersonaName())
	print(Steam.getAchievement("TEST"))
	if not Steam.setAchievement("SHADOW_CLICKS_1"):
		print("Failed to set achievement: test")
		return
	Steam.storeStats()

func _process(delta: float) -> void:
	Steam.run_callbacks()

func _on_steam_stats_ready() -> void:
	print(Steam.getAchievement("SHADOW_CLICKS_1"))
