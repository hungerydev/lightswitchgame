extends Control


@onready var notes: Label = $PanelContainer/VBoxContainer/ScrollContainer/Notes
@export var patch_notes: TextDeliver

func _ready() -> void:
	var text = patch_notes._get_text()
	notes.text = text


func _on_back_pressed() -> void:
	queue_free()
