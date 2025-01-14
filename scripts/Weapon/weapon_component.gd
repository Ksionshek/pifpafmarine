class_name WeaponComponent
extends Node2D

@export var bullet_scene: PackedScene
@export var fire_rate: float = 0.5
@export var bullet_speed: float = 300.0
@export var spread: float = 0.0

var can_fire: bool = true

func shoot(direction: Vector2, spawn_position: Vector2) -> void: 
	if not can_fire:
		return

	var bullet = bullet_scene.instantiate()
	get_parent().add_child(bullet)
	bullet.global_position = spawn_position

	# Add random spread to direction
	if spread > 0.0:
		var angle_offset = randf_range(-spread / 2, spread / 2)
		direction = direction.rotated(deg_to_rad(angle_offset))

  
	if bullet.has_node("E_MovementComponent"):
		print("WeaponComp: bullet f_has_node: ")
		var move_component = bullet.get_node("E_MovementComponent")
		move_component.update_velocity(direction.normalized() * bullet_speed)
		

	# Timer for fire rate
	can_fire = false
	await get_tree().create_timer(fire_rate).timeout
	can_fire = true
	
