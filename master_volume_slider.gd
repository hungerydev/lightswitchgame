extends HSlider

@onready var index = AudioServer.get_bus_index("Master")

func _ready() -> void:
	self.value = AudioServer.get_bus_volume_db(index)
	self.value_changed.connect(_volume_change)

func _volume_change(value) -> void:
	AudioServer.set_bus_volume_db(index, value)
