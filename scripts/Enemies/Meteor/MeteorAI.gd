class_name MeteorAI
extends Node


@onready var health_component: HealthComponent = $"../HealthComponent"
@onready var move_component: MoveComponent = $"../MoveComponent"

func _process(delta: float) -> void:
	if GameManager.player != null:
		#print('MeteorAI.gd: player not null')
		move_component.velocity = move_component.actor.global_position.direction_to(GameManager.player.global_position)
		#print('MeteorAI.gd: velocity' + str(move_component.velocity)) 
		
	move_component.actor.global_position += move_component.velocity * move_component.speed * delta
		
