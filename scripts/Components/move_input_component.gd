class_name MoveInputComponent
extends Node2D

@export var move_stats: MoveStats
@export var move_component: MoveComponent

func _input(event: InputEvent) -> void:
	var input_axis = Input.get_vector('left', 'right', 'up', 'down')
	move_component.velocity = Vector2(input_axis * move_stats.speed)	
