extends HSlider

@onready var index = AudioServer.get_bus_index("Master")

func _ready() -> void:
	self.value = Wwise.get_rtpc_value("MasterBusSetting", null)
	self.value_changed.connect(_volume_change)

func _volume_change(new_value) -> void:
	Wwise.set_rtpc_value("MasterBusSetting", new_value, null)
