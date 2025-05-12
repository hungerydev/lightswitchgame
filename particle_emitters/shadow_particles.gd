extends GPUParticles3D

@onready var cam: Camera3D = $"../Camera3D"
@onready var particle_target: Node3D = $particleTarget



func _ready() -> void:
	add_to_group("Particle Emitter")
	sb._monster_clicked.connect(_monster_clicked)

func _monster_clicked() -> void:
	var m_pos = get_viewport().get_mouse_position()
	var ray_start = cam.project_ray_origin(m_pos)
	var ray_end = ray_start + cam.project_ray_normal(m_pos) * 7
	process_material.gravity = self.global_position - particle_target.global_position
	process_material.gravity.normalized()
	global_position = ray_end
	restart()
