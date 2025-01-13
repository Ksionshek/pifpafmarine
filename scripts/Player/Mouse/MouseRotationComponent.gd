class_name MouseRotationComponent
extends Node2D

#Script for rotating player to always point at mouse
#Player's rotation speed # Pi -> half circle | Tau -> full circle
@export var rotation_speed: float = 5.0


func _process(delta: float) -> void:
	var mouse_position = get_global_mouse_position()
	var direction_to_mouse = (mouse_position - global_position).normalized()
	var angle_to_mouse = direction_to_mouse.angle() + deg_to_rad(90)


	#Rotate player to mouse - adding lerp for smoothing
	get_parent().rotation = lerp_angle(get_parent().rotation, angle_to_mouse, rotation_speed * delta)
	
	
func rad2deg(radians: float) -> float:
	return radians * 180.0 / PI
