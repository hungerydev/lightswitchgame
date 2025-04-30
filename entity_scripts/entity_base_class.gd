extends Node3D
class_name Entity

var vcom: VisibilityComponent

var pcom: PositionComponent

var chance_active = false

func _ready() -> void:
	add_to_group("Entity")
	var new_pcom = preload("uid://b2u4efyyur6jb").instantiate()
	add_child(new_pcom)
	var new_vcom = preload("uid://dwej31ruiny7c").instantiate()
	add_child(new_vcom)
	sb._event_start.connect(_event_start)
	sb._event_finished.connect(_reset)
	sb._fail.connect(_fail)
	vcom = $visibilityComponent
	pcom = $positionComponent

func _event_start(event) -> void:
	pass

func _reset() -> void:
	pass

func _fail(string) -> void:
	pass

func _random_chance() -> void:
	pass
	
