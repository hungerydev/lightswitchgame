extends Node3D

@onready var three: MeshInstance3D = $End2DSequence1_3
@onready var three_mat: AnimatedTexture = $End2DSequence1_3.mesh.material.albedo_texture
@onready var four: MeshInstance3D = $End2DSequence1_4
@onready var four_mat: AnimatedTexture = $End2DSequence1_4.mesh.material.albedo_texture
@onready var five: MeshInstance3D = $End2DSequence1_5
@onready var five_mat: AnimatedTexture = $End2DSequence1_5.mesh.material.albedo_texture
@onready var six: MeshInstance3D = $End2DSequence1_6
@onready var six_mat: AnimatedTexture = $End2DSequence1_6.mesh.material.albedo_texture
@onready var seven: MeshInstance3D = $End2DSequence1_7
@onready var seven_mat: AnimatedTexture = $End2DSequence1_7.mesh.material.albedo_texture


func _ready() -> void:
	sb._event_start.connect(_event_start)

func _event_start(event) -> void:
	match event:
		gb.end1.END_1_6:
			one_three()
		gb.end1.END_1_7:
			one_four()
		gb.end1.END_1_8:
			one_six()
		gb.end1.END_1_9:
			off()

func one_three() -> void:
	sb._remote_sun_on.emit()
	sb._remote_light_on.emit()
	visible = true
	three.visible = true

func one_four() -> void:
	three.visible = false
	four_mat.set_current_frame(0)
	four.visible = true
	await get_tree().create_timer(0.96, false).timeout
	one_five()
	

func one_five() -> void:
	four.visible = false
	five.visible = true

func one_six() -> void:
	five.visible = false
	six_mat.set_current_frame(0)
	six.visible = true
	await get_tree().create_timer(0.64, false).timeout
	six.visible = false
	seven.visible = true

func off() -> void:
	sb._remote_light_off.emit()
	visible = false
	
	
