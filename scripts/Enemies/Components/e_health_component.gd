class_name e_HealthComponent extends Node2D

@export var entity := Area2D
@export var hp := 10
@export var max_health := 10

func _ready() -> void:
	hp = max_health
	
	
func take_damage(amount: int):
	hp -= amount
	if hp <= 0:
		die()
		
func die():
	print(str(entity.name) + " died")
	queue_free()
	
func is_dead() -> bool:
	return hp == 0
