extends RigidBody3D


@export var FALL_DOWN_HEIGHT = 8
@export var fall_down_distance = 25

@onready var gpu_particles_3d: GPUParticles3D = $GPUParticles3D
@onready var audio_stream_player_3d: AudioStreamPlayer3D = $AudioStreamPlayer3D

var player
var on_ground = false
 
func _ready() -> void:
	gravity_scale = 0
	position.y = FALL_DOWN_HEIGHT
	player = get_tree().get_first_node_in_group("player")

func _process(delta: float) -> void:
	var player_z_vector = Vector3(0, 0, player.position.z)
	var obstacle_z_vector = Vector3(0, 0, position.z)
	var distance_between = player_z_vector.distance_to(obstacle_z_vector)
	
	if distance_between < fall_down_distance:
		gravity_scale = 1

func _on_body_entered(body: Node) -> void:
	if body is Floor and !on_ground:
		gpu_particles_3d.emitting = true
		audio_stream_player_3d.play()
		on_ground = true
